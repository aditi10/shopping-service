The application can be built using  a Dockerfile 

To build the application 
docker build -t shop .
docker tag shop 10112018/shop:latest
docker push 10112018/shop:latest

Once the application is built push it to Dockerhub or any repository
