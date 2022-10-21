# Creation of the image and publication in my docker repository
newgrp docker   
docker build . -t ubuntu_flask:1.0.2  
docker tag ubuntu_flask:1.0.2 anthonyrouquier/ubuntu_flask:1.0.2  
docker push anthonyrouquier/ubuntu_flask:1.0.2

# To test and fiddle with the image
docker run -it --name flask  ubuntu_flask:1.0.2 
(or)  
docker run -d --name flask  ubuntu_flask:1.0.2
docker exec -it flask bash
# Creation and start of the container with docker-compose
docker compose up

# deploy application in a cluster 

minikube start  
kubectl apply -f exo3.yaml  


# ------------------------------    
While I do not have any error while running these commands, I can't get the results whished for. 
I assume this is due to a mistake in either the set-up of flask or the flask svc, but I was not able to find it.
