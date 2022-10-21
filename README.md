# Creation of the image and publication in my docker repository
newgrp docker   
docker build . -t ubuntu_flask:1.0.2  
docker tag ubuntu_flask:1.0.2 anthonyrouquier/ubuntu_flask:1.0.2  
docker push anthonyrouquier/ubuntu_flask:1.0.2

# Creation and start of the container with docker-compose
docker compose up

# deploy application in a cluster 

minikube start

kubectl apply -f exo3.yaml

docker run -it --name flask  ubuntu_flask:1.0.2 

or 

docker run -d --name flask  ubuntu_flask:1.0.2
