FROM openhab/openhab:2.1.0-snapshot-amd64

ENV OPENHAB_VERSION="2.1.0-snapshot"

# Set variables
ENV \
    APPDIR="/openhab" \
    DEBIAN_FRONTEND=noninteractive \
    EXTRA_JAVA_OPTS="" \
    JAVA_HOME='/usr/lib/java-8' \
    OPENHAB_HTTP_PORT="8080" \
    OPENHAB_HTTPS_PORT="8443"

# Expose volume with configuration and userdata dir
VOLUME ${APPDIR}/conf ${APPDIR}/userdata ${APPDIR}/addons

# Execute command
WORKDIR ${APPDIR}
EXPOSE 8080 8443 8101
ENTRYPOINT ["/entrypoint.sh"]
CMD ["gosu", "openhab", "./start.sh"]
