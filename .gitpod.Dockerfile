FROM gitpod/workspace-full

# Install Dart SDK
RUN curl -fsSL https://dart.dev/install.sh | sh

# Add Dart SDK to PATH
ENV PATH="/root/.dart-sdk/bin:${PATH}"