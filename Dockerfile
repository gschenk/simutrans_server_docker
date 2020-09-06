# this builds a docker container with a build environment
# for simutrans in alpine linux
ARG simsrc_arg=/src/simutrans

FROM alpine:latest AS build

ENV SIMUTRANSREPO https://github.com/aburch/simutrans.git
ARG simutranssrc_arg
ENV SIMUTRANSSRC=$simutranssrc_arg

# install dependencies
RUN  apk add --no-cache \
  git

# copy files for build
COPY build /

# clone simutrans repo
RUN git clone $SIMUTRANSREPO $SIMUTRANSSRC


# Build single layer image from previous stage
FROM scratch

ARG simutranssrc_arg
ENV SIMUTRANSSRC=$simutranssrc_arg

COPY --from=build .

# open shell for debugging
CMD /bin/ash
