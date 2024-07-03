FROM public.ecr.aws/docker/library/buildpack-deps:bookworm

RUN apt-get -y update && apt-get -y install fish

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin

WORKDIR /root

CMD fish
