FROM gradle:8.0.2-jdk17 AS builder
WORKDIR /build
COPY . /build
RUN apt update && apt install -y git
RUN git config --global user.email "machine@cow.network"
RUN git config --global user.name "udder-machine"
RUN cd ./Paper && gradle applyPatches && gradle createReobfBundlerJar

FROM gcr.io/distroless/java17
WORKDIR /opt/spigot
EXPOSE 25565
COPY --from=builder /build/Paper/build/libs/*.jar /opt/spigot/spigot.jar
ENV JAVA_TOOL_OPTIONS=-Dcom.mojang.eula.agree=true 
CMD ["spigot.jar", "--nogui"]
