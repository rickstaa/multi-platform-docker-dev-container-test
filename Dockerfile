# Use the official CUDA image as the build base image.
FROM --platform=$BUILDPLATFORM nvidia/cuda:12.3.2-cudnn9-devel-ubuntu22.04 as build

# Retrieve and echo build Arguments.
ARG BUILDPLATFORM
RUN echo "Building for $BUILDPLATFORM"
ARG	TARGETARCH
RUN echo "Building for $TARGETARCH"
ARG	BUILDARCH
RUN echo "Building for $BUILDARCH"

# Create a hello world text file.
RUN echo "Hello World!" > /hello.txt

# Create final multi platform base images.
FROM --platform=$TARGETPLATFORM	nvidia/cuda:12.3.2-cudnn9-devel-ubuntu22.04 AS cuda-amd64-base
FROM --platform=$TARGETPLATFORM	nvidia/cuda:12.3.2-cudnn9-devel-ubuntu22.04 AS cuda-arm64-base

# Use the platform specific base image.
ARG TARGETARCH
FROM cuda-${TARGETARCH}-base

# Retrieve and echo build Arguments.
ARG BUILDPLATFORM
RUN echo "Building for $BUILDPLATFORM"
ARG	TARGETARCH
RUN echo "Building for $TARGETARCH"
ARG	BUILDARCH
RUN echo "Building for $BUILDARCH"

# Copy the hello world text file from the build image.
COPY --from=build /hello.txt /hello.txt
