ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8


# Install required dependencies
RUN apk add --no-cache confuse libftdi1 libstdc++ gdb

# Copy libraries

COPY tellstick-core/etc /etc
COPY tellstick-core/usr /usr
COPY tellstick-core/var /var

# Copy data
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]