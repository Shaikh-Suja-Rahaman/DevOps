# Docker Networking & Volumes Homework

This repository documents my practice with Docker networks, bind mounts, and overlay networks.

---

## Task 1: Docker Container Networking
**Goal:** Create multiple networks, deploy frontend, backend, and database containers, and test their connectivity across networks.

**Commands Used:**
```bash
# 1. Create 3 different networks
docker network create frontend-net
docker network create backend-net
docker network create database-net

# 2. Deploy containers and attach them to networks
docker run -d --name db-container --network database-net -e MYSQL_ROOT_PASSWORD=root mysql:latest
docker run -d --name backend-container --network backend-net alpine sleep 3600
docker run -d --name frontend-container --network frontend-net nginx:alpine

# 3. Add the backend container to 2 additional networks so it can talk to the DB and frontend
docker network connect database-net backend-container
docker network connect frontend-net backend-container

# 4. Check connectivity (from backend to db)
docker exec backend-container ping -c 3 db-container
```

**Screenshot of successful connectivity check:**
![](./screenshots/task%201.png)

---

## Task 2: Host Network
**Goal:** Run an Apache container directly on the host's network.

**Commands Used:**
```bash
docker pull httpd:latest
docker run -d --name apache-host --network host httpd:latest
```
*(Note: Because I am on a Mac, Docker Desktop handles `--network host` differently than native Linux. The container runs, but it does not map port 80 directly to `localhost` in the same way. However, the command successfully demonstrates how to launch a container using the host network driver).*

**Screenshot of container running with host network:**
![](./screenshots/task%202.png)

---

## Task 3: Bind Mount
**Goal:** Bind mount a local folder to a container, view the content, and dynamically update it without restarting the container.

**What I did:**
I created a folder called `html-mount` with an `index.html` file inside it containing "Hello students". 
Then I ran the following command to bind mount it to an Nginx container:

**Commands Used:**
```bash
# Make sure you run this command while inside the "Docker Network" directory
docker run -d -p 8085:80 --name nginx-bind -v "$(pwd)/html-mount:/usr/share/nginx/html" nginx:alpine
```
After verifying it on `http://localhost:8085`, I modified the file on my Mac and instantly saw the changes reflected in the browser without having to restart the container!

**Screenshot showing the webpage before and after modification:**
![](./screenshots/task%203.png)

---

## Task 4: Overlay Network Research
**Goal:** Research Docker overlay networks and understand their use cases across multiple Docker hosts.

### What is an Overlay Network?
An overlay network is a distributed network built on top of an existing network. In Docker, it creates a secure, private network that connects multiple Docker daemons (hosts) together. It allows containers running on entirely different physical or virtual servers to communicate with each other securely, as if they were on the exact same local machine.

### Use Cases
* **Docker Swarm:** Overlay networks are the default network driver for Docker Swarm services, enabling seamless communication between nodes in a cluster.
* **Microservices:** When deploying a complex application broken into dozens of microservices across multiple servers, an overlay network ensures they can all talk to each other without exposing ports to the public internet.
* **High Availability & Load Balancing:** By networking multiple hosts, you can distribute workloads. If one host fails, containers on another host can continue communicating over the overlay network.

---

## Cleanup
Once you are done taking screenshots, run these commands to clean up your Docker environment:
```bash
docker stop db-container backend-container frontend-container apache-host nginx-bind
docker rm db-container backend-container frontend-container apache-host nginx-bind
docker network rm frontend-net backend-net database-net
```
