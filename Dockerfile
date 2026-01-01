FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY ./StarterFiles /usr/share/nginx/html

EXPOSE 80