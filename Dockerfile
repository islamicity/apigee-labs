FROM nginx

# make the 'app' folder the current working directory
WORKDIR /app

# copy the dist folder into the app folder
COPY ./apigee-labs.zip /app
COPY ./bundles.zip /app
COPY ./index.html /app

# now unzip the files to a specified location
RUN apt-get update
RUN apt-get install unzip -y

RUN unzip apigee-labs.zip -d app/
RUN unzip bundles.zip -d app/

# copy the nginx configuration file into the docker image
COPY nginx.conf /etc/nginx/nginx.conf

#get necessary dependencies for the health check performed by AWS Fargate
RUN apt-get update && apt-get install curl -y

#expose port 8080
EXPOSE 8080
