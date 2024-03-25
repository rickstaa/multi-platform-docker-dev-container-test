# Try to use a platform specific base image.
FROM --platform=$BUILDPLATFORM balenalib/${TARGETARCH}-ubuntu-node as build

# Retrieve and echo build Arguments.
ARG BUILDPLATFORM
RUN echo "Building for $BUILDPLATFORM"
ARG	TARGETARCH
RUN echo "Building for $TARGETARCH"
ARG	BUILDARCH
RUN echo "Building for $BUILDARCH"
