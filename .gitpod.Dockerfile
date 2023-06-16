FROM gitpod/workspace-full

USER root

# Install Dart SDK
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' && \
    apt-get update && \
    apt-get install -y dart

ENV PATH="/usr/lib/dart/bin:${PATH}"

USER gitpod

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 && \
    export PATH="$PATH:/workspace/flutter/bin" && \
    flutter config --enable-web

ENV PATH="/workspace/flutter/bin:${PATH}"