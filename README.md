jenkins-slave
=============

This will create the jenkins slave which can be configured from jenkins master

Usage
-----

To create the image `fnubhupen/jenkins-slave`, execute the following command on the fnubhupen/jenkins-slave folder:

    docker build -t fnubhupen/jenkins-slave .

run the image and make sure it's working correctly.

    docker run -t -i jenkins-slave 
    
You can see that the docker container is running using the "docker ps -a" command.

    docker ps -a 
    
This will give you a list of the currently running docker containers, including a unique identifier which will be needed for the next step.

    docker inspect <containerId>  
    docker inspect <containerId> | grep IP
    
The second command shows the virtual IP address of the running container which we can use to test the ssh connection.  If everything is working, you should be able to log into the container using the username and password "jenkins".

    ssh jenkins@172.17.0.2  

If the login is successful, you can also check that the correct version of Java is installed.

    java -version
