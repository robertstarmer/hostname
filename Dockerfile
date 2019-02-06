FROM nginx:latest
ARG VERSION
ENV VERSION=$VERSION
COPY hostname.sh .
CMD ["/hostname.sh"]
