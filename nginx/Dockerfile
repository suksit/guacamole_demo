FROM nginx:1.21.6-alpine

ARG MAX_UPLOAD_SIZE

COPY default.conf /etc/nginx/conf.d/

RUN sed -i "s/MAX_UPLOAD_SIZE/${MAX_UPLOAD_SIZE}/g" /etc/nginx/conf.d/default.conf
