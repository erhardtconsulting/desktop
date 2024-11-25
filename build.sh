#!/usr/bin/env bash

# default variables
BUILDER="docker"
CONTAINER="base"
BUILD_CHILDS="false"
VERBOSE="false"

# set base variables
SCRIPT_DIR=$(dirname "$(realpath "$0")")
VALID_CONTAINERS=()

debug_msg() {
  if [ "$VERBOSE" = "true" ]; then
    echo "$1"
  fi
}

show_help() {
  cat << EOF
🔥 Container build tool 🔥
usage: ./build.sh [-c|--build-childs] [-p|--podman] [--platform PLATFORM] [-v|--verbose] CONTAINER
options:
  -c|--build-childs: rebuilds childs, when base image was updated
  -p|--podman:       enabled podman builds (default docker builds)
  --platform:        specify build platform (e.g., linux/amd64, linux/arm64)
  -v|--verbose:      enable verbose mode

Report bugs to: simon@erhardt.consulting
EOF
}

check_system() {
  debug_msg "Checking build system..."
  command -v yq >/dev/null 2>&1 || { echo "⛔ Error: yq is not installed." >&2; exit 255; }
  if [ "$BUILDER" = "podman" ]; then
    echo "Using builder: podman 🛸"
    command -v podman >/dev/null 2>&1 || { echo "⛔ Error: podman is not installed." >&2; exit 255; }
  elif [ "$BUILDER" = "docker" ]; then
    echo "Using builder: docker 🚀"
    command -v docker >/dev/null 2>&1 || { echo "⛔ Error: docker is not installed." >&2; exit 255; }
  else
    echo "⛔ Error: BUILDER variable must be either 'podman' or 'docker'." >&2
    exit 255
  fi
}

get_containers() {
  for dir in "$SCRIPT_DIR"/*/; do
      # check if Dockerfile and meta.yaml exists
      if [ -f "$dir/Dockerfile" ] && [ -f "$dir/meta.yaml" ]; then
          # then add VALID_CONTAINERS
          VALID_CONTAINERS+=("$(basename "$dir")")
      fi
  done

  debug_msg "Available containers: $(IFS=', '; echo "${VALID_CONTAINERS[*]}")"
}

run_build() {
  local container_name=$1
  local container_path="$SCRIPT_DIR/$container_name"
  local tag_version
  local tag_name
  local digest

  # check if container is valid
  [[ ${VALID_CONTAINERS[*]} =~ (^|[[:space:]])$container_name($|[[:space:]]) ]] || { echo "⛔ Error: Container '$container_name' is not available." >&2; exit 255; }

  # get metadata
  tag_name=$(yq '.tag' "$container_path/meta.yaml")
  tag_version=$(yq '.version' "$container_path/meta.yaml")

  # build container
  build_container "$container_path" "$tag_name:$tag_version"
  if [ -n "$digest" ]; then
    echo "✅ Build completed. Digest: $digest"
  else
    echo "⛔ Error: Failed to retrieve the digest." >&2
    exit 1
  fi

  # update child containers
  echo "🔄 Updating child containers..."
  for dir in "${VALID_CONTAINERS[@]}"; do
    dockerfile="$SCRIPT_DIR/$dir/Dockerfile"
    if [ -f "$dockerfile" ]; then
      # Check if image is a child image
      if grep -qE "^FROM ${tag_name}(:|$)" "$dockerfile"; then
        debug_msg "Checking if $dockerfile needs updating..."

        # update the Dockerfile
        sed -i.bak -E "s|^FROM ${tag_name}.*|FROM ${tag_name}:${tag_version}@${digest}|" "$dockerfile"

        # compare original and updated files
        if cmp -s "$dockerfile" "${dockerfile}.bak"; then
          debug_msg "No changes in $dockerfile."
          
          # delete backup file
          rm "${dockerfile}.bak"
        else
          echo "✅ Updated $dockerfile"
          if [ "$BUILD_CHILDS" = "true" ]; then
            echo "🔄 Trigger rebuild..."
            run_build "$dir"
          fi
        fi
      fi
    fi
  done
}

build_container() {
  local context=$1
  local tag=$2

  echo "🚀 Building container '$container_name'..."
  echo "Using tag: $tag_name:$tag_version"
  debug_msg "Using context: $context"

  if [ -n "$PLATFORM" ]; then
    PLATFORM_CMD="--platform $PLATFORM"
    echo "Using platform: $PLATFORM"
  else
    PLATFORM_CMD=""
  fi

  if [ "$BUILDER" = "podman" ]; then
    (set -x; podman build $PLATFORM_CMD -f "$context/Dockerfile" -t "$tag" "$context")
    digest=$(podman inspect "$tag" --format '{{.Digest}}' || true)
  elif [ "$BUILDER" = "docker" ]; then
    (set -x; docker buildx build $PLATFORM_CMD -f "$context/Dockerfile" -t "$tag" "$context" --progress=plain --load)
    digest=$(docker inspect "$tag" --format '{{index .RepoDigests 0}}' | sed 's/^.*@//' || true)
  fi
}

# parse arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    -c|--build-childs)
      BUILD_CHILDS="true"
      shift 1
      ;;
    -p|--podman)
      BUILDER="podman"
      shift 1
      ;;
    -h|--help)
      show_help
      exit 1
      ;;
    -v|--verbose)
      VERBOSE="true"
      shift 1
      ;;
    --platform)
      PLATFORM="$2"
      shift 2
      ;;
    -*)
      echo "unknown option: $1" >&2
      exit 1
      ;;
    *)
      CONTAINER="$1";
      shift 1
      ;;
  esac
done

echo "🔥 Container build tool 🔥"
check_system
get_containers
run_build "$CONTAINER"