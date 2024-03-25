# VScode dev container build arguments

This is a small example repository to show that [buildx](https://docs.docker.com/reference/cli/docker/buildx/build/) build arguments are not working as expected when trying to open a [multi-platform](https://docs.docker.com/build/guide/multi-platform/#build-using-cross-compilation) container as a [VScode dev container](https://code.visualstudio.com/docs/remote/containers-advanced#_using-build-args).

## How to reproduce

1. Try to build the docker image with the following command:

   ```bash
   docker build --progress=plain --no-cache -t regular-build:test .
   ```

2. See that it works.
3. Try to open this repository in a VScode dev container.
4. See that it fails. With the following error:

   ```bash
   [2024-03-25T10:09:40.415Z] Start: Run: docker inspect --type image cuda--base
   [2024-03-25T10:09:40.429Z] Stop (14 ms): Run: docker inspect --type image cuda--base
   [2024-03-25T10:09:40.429Z] Path 'library/cuda--base' for input 'docker.io/library/cuda--base' failed validation.  Expected path to match regex '/^[a-z0-9]+([._-][a-z0-9]+)*(\/[a-z0-9]+([._-][a-z0-9]+)*)*$/'.
   [2024-03-25T10:09:40.429Z] Error fetching image details: Could not parse image name 'cuda--base'
   [2024-03-25T10:09:40.429Z] Start: Run: docker pull cuda--base
   [2024-03-25T10:09:40.441Z] Using default tag: latest
   [2024-03-25T10:09:41.643Z] Error response from daemon: pull access denied for cuda--base, repository does not exist or may require 'docker login': denied: requested access to the resource is denied
   [2024-03-25T10:09:41.646Z] Stop (1217 ms): Run: docker pull cuda--base
   [2024-03-25T10:09:41.646Z] []
   [2024-03-25T10:09:41.646Z] Error response from daemon: No such image: cuda--base:latest

   [2024-03-25T10:09:41.648Z] Error: Command failed: docker inspect --type image cuda--base
   ```

> [!NOTE]
> I also added the `Dockerfile.complicated` Dockerfile that is more close to our real-world scenario. It also fails with the same error.
