FROM nikashitsa/file-backup
LABEL maintainer="Nikita Verkhovin <vernik91@gmail.com>"

RUN set -x \
  && apk add --no-cache postgresql-client

COPY bin/* /bin/
