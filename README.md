# CI/CD Project with Jenkins, Python Flask, and Docker
This project is a demonstration of how to set up a CI/CD pipeline using Jenkins, Python Flask, and Docker. The pipeline builds a Docker container with a Python Flask web app that is secured with a self-signed SSL certificate. The container is then pushed to DockerHub and deployed to a remote server using SSH.

## Prerequisites
Before getting started, you should have the following prerequisites:

* Jenkins server installed
* Docker installed on the Jenkins server
* Python and Flask installed on the Jenkins server
* A DockerHub account
* A remote server with SSH access

## Installation
1. Clone the repository to your Jenkins server.
bash 
git clone https://github.com/your_username/your_project.git


2. Create a new Jenkins job and configure the pipeline as follows:
* Select "Pipeline" as the project type.
* In the "Pipeline" section, set the definition to "Pipeline script from SCM".
* Set the SCM to "Git" and provide the repository URL and credentials.
* In the "Script Path" field, enter the path to your Jenkinsfile (e.g., Jenkinsfile).
3. Save the job configuration and run the pipeline.

## Pipeline Steps
The pipeline consists of the following steps:

1. Build: Builds the Docker image with the Python Flask web app.

2. Test: check status codeof the Python Flask web app.

3. Push to DockerHub: Pushes the Docker image to DockerHub.

4. Deploy to Remote Server: Deploys the Docker container to the remote server using SSH.

