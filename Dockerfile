FROM nginx

# make the 'app' folder the current working directory
WORKDIR /app

# copy the dist folder into the app folder
COPY /apigee* /app
COPY /bundles /app/bundles

# copy the nginx configuration file into the docker image
COPY nginx.conf /etc/nginx/nginx.conf

#get necessary dependencies for the health check performed by AWS Fargate
RUN apt-get update && apt-get install curl -y

#expose port 8080
EXPOSE 8080
