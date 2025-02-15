FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page105/happy-print-shop.zip .
RUN unzip happy-print-shop.zip
RUN mv happy-print-shop/* .
RUN rm -rf happy-print-shop happy-print-shop.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
