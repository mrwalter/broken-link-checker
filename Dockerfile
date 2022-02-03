FROM ubuntu:20.04

ARG PROJECT_PATH=broken-link-checker
RUN mkdir -p "${PROJECT_PATH}"

# When installing npm, it asks for geographic area
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y \
    npm

# Copy the code in to the container
COPY ./ "${PROJECT_PATH}/"

WORKDIR "${PROJECT_PATH}"

# Install broken-link-checker in the container
RUN npm install broken-link-checker -g

ENTRYPOINT ["blc"]
