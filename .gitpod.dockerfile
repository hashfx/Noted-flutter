FROM gitpod/workspace-full

USER root

ENV FLUTTER_HOME=/home/gitpod/flutter

RUN apt-get update && apt-get -y install git curl unzip wget

RUN apt-get install -y gcc make build-essential wget curl unzip apt-utils xz-utils libkrb5-dev gradle libpulse0 android-tools-adb android-tools-fastboot
RUN apt-get install -y openjdk-8-jdk

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

USER gitpod
WORKDIR /home/gitpod

RUN git clone https://github.com/flutter/flutter && \
    /home/gitpod/flutter/bin/flutter config --enable-web

ENV PUB_CACHE=/home/gitpod/.pub_cache
ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

# Android
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV ANDROID_HOME="/home/gitpod/.android"
ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip"
ENV ANDROID_SDK_ARCHIVE="${ANDROID_HOME}/archive"
ENV ANDROID_STUDIO_PATH="/home/gitpod/"

RUN cd "${ANDROID_STUDIO_PATH}"
RUN wget -qO android_studio.zip https://dl.google.com/dl/android/studio/ide-zips/3.3.0.20/android-studio-ide-182.5199772-linux.zip
RUN unzip android_studio.zip
RUN rm -f android_studio.zip

RUN mkdir -p "${ANDROID_HOME}"
RUN touch $ANDROID_HOME/repositories.cfg
RUN wget -q "${ANDROID_SDK_URL}" -O "${ANDROID_SDK_ARCHIVE}"
RUN unzip -q -d "${ANDROID_HOME}" "${ANDROID_SDK_ARCHIVE}"
RUN echo y | "${ANDROID_HOME}/tools/bin/sdkmanager" "platform-tools" "platforms;android-28" "build-tools;28.0.3"
RUN echo y | "${ANDROID_HOME}/tools/bin/sdkmanager" "platform-tools" "platforms;android-29" "build-tools;29.0.3"
RUN rm "${ANDROID_SDK_ARCHIVE}"

# Hygen
RUN npm i -g hygen

# Env
RUN echo 'export PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:$PATH' >>~/.bashrc
