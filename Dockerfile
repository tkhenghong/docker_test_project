# Mention the tool that is needed to build the image. (For Node.JS to build the app, you need Node.JS, node command)
FROM node:16

# Give Environment variables for starting the app.
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# Create a directory inside the container when running. (will not affect your host machine directories)
RUN mkdir -p /home/app

# Important Line: Copy your host machine's current directory to Docker Container's /home/app directory
# (Why not RUN cp ../.. ../.. ? Because cp command is executed INSIDE the Container, while COPY command executes on the HOST machine. If you got some files that needed to be copied in the host machine to the container, use COPY)
COPY . /home/app

# CMD means like you type in terminal something to start up the application. In here, this same as you write "node server.js" in your terminal to start the app.
CMD ["node", "/home/app/server.js"]
