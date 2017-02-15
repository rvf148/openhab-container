FROM openhab/openhab:2.1.0-snapshot-amd64

#Add midnight commander
RUN apt-get update && apt-get install -y \
mc

EXPOSE 8080 8443 5555
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["gosu", "openhab", "./start.sh"]
