FROM public.ecr.aws/docker/library/buildpack-deps:bookworm
RUN apt-get -y update && apt-get -y install fish
RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
RUN curl -fsSL https://moonrepo.dev/install/proto.sh | bash -s -- --yes
ENV PROTO_HOME="/root/.proto"
ENV PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"
RUN proto --version
RUN proto plugin add --global moon "https://raw.githubusercontent.com/moonrepo/moon/master/proto-plugin.toml"
RUN proto install moon && cd / && moon --version
COPY . /root/.local/share/chezmoi
RUN chezmoi apply
WORKDIR /root
