FROM ruby:2.7

LABEL com.github.actions.name="StandardRB"
LABEL com.github.actions.description="Lint your Ruby code in parallel to your builds with StandardRB"
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="red"
LABEL maintainer="Bryce Mecum <petridish@gmail.com>"

COPY lib /action/lib
ENTRYPOINT ["/action/lib/entrypoint.sh"]
