FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://github.com/Preethika1223/Portfolio_zip_file/blob/main/developer-portfolio-preethika.zip .
RUN unzip developer-portfolio-preethika.zip
RUN mv developer-portfolio-preethika/* .
RUN rm -rf developer-portfolio-preethika developer-portfolio-preethika.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
