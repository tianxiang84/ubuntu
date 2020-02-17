Ref: https://hub.docker.com/r/rycus86/intellij-idea/dockerfile
On your host machine, chmod 777 <java folder>
docker build -f docker/Dockerfile_intellij -t tianxiang84/intellij - < docker/Dockerfile_intellij
docker run --rm -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/java:/home/TSu/java tianxiang84/intellij:latest
java -cp out/production/my-first-java-app myfirstapp.MyJavaApp #java -cp path package.class

docker build -f docker/Dockerfile_java -t tianxiang84/java .
docker run --rm -it -v $(pwd)/java:/home/java tianxiang84/java
https://www.javaworld.com/article/2076075/core-java-learn-java-from-the-ground-up.html
