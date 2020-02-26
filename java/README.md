Ref: https://hub.docker.com/r/rycus86/intellij-idea/dockerfile
On your host machine, chmod 777 <java folder>
docker build -f docker/Dockerfile_intellij -t tianxiang84/intellij - < docker/Dockerfile_intellij
docker run --rm -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/java:/home/TSu/java tianxiang84/intellij:latest
java -cp out/production/my-first-java-app myfirstapp.MyJavaApp #java -cp path package.class

docker run --rm -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/TSu/Projects/conveyance/tool_planner:/home/TSu/java tianxiang84/intellij:latest
java -cp out/production/my-first-java-app myfirstapp.MyJavaApp #java -cp path package.class

Install Xming
Set IP in x0.hosts as e.g., 172.31.224.1 (ipconfig, iPv4)
Start Xming
docker run --privileged --rm -e DISPLAY=172.31.224.1:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v "xxx":/home/TSu/java tianxiang84/intellij:latest
java -cp out/production/my-first-java-app myfirstapp.MyJavaApp #java -cp path package.class

docker build -f docker/Dockerfile_java -t tianxiang84/java .
docker run --rm -it -v $(pwd)/java:/home/java tianxiang84/java
https://www.javaworld.com/article/2076075/core-java-learn-java-from-the-ground-up.html
