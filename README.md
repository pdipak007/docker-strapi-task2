# Strapi Docker Application
This is a simple Strapi CMS application running in Docker containers.
## What's This?
I created this project to learn how to containerize a Strapi application using Docker. Strapi is a headless CMS that makes it easy to build APIs.
## What You Need
Docker Desktop installed on your computer
That's it!
## How to Run
### 1.Clone this repo:
```
git clone https://github.com/pdipak007/docker-strapi-task2.git
cd docker-strapi-task2
```
### 2.Build and start the containers:
```
docker-compose build
docker-compose up -d
```
### 3.Open your browser and go to:
```
http://localhost:1337/admin
```
### 4.Create your admin account when you first visit.

## Screenshots
<img width="1417" height="838" alt="Screenshot 2026-02-09 at 10 41 01 PM" src="https://github.com/user-attachments/assets/8333d304-53ac-4c6a-b809-9dec3fa979e4" />
<img width="1253" height="674" alt="Screenshot 2026-02-09 at 10 41 26 PM" src="https://github.com/user-attachments/assets/f97381e7-d39e-4931-9438-b6b46bdaabbc" />
<img width="1431" height="892" alt="Screenshot 2026-02-09 at 10 40 34 PM" src="https://github.com/user-attachments/assets/2d448a93-5ce8-40a3-be73-acce9294d513" />

## Useful Commands
### - Stop the application:
```
docker-compose down
```
### - View logs:
```
docker-compose logs -f strapi
```
### - Restart:
```
docker-compose restart
```
## What's Inside
-  Dockerfile  - Instructions to build the Docker image
- docker-compose.yml - Configuration for running the container
- .dockerignore - Files to exclude from the Docker build
- src/ - Strapi application code
- config/ - Configuration files

## How It Works
### The Docker container:
- Uses Node.js 20 on Alpine Linux (lightweight)
- Installs all Strapi dependencies
- Runs Strapi in development mode
- Uses SQLite database (stored in .tmp folder)
- Exposes port 1337

## Database
Currently using SQLite for simplicity. All data is stored in the .tmp folder which is mounted as a volume, so your data persists even when you restart the container.
## Notes
- This is configured for development. For production, you'd want to use a proper database like PostgreSQL.
- The secrets in docker-compose.yml are just examples. In production, use secure random strings.
- First time running takes a few minutes to build everything.

## Problems?
### Container won't start?
- Make sure Docker Desktop is running
- Check if port 1337 is already in use
### Can't access the admin?
- Wait a minute for Strapi to fully start
- Check logs: docker-compose logs -f strapi
### Want to start fresh?
```
docker-compose down -v
docker-compose up -d
```
(Warning: This deletes all your data)

## Tech Stack
- Strapi v5.35.0
- Node.js v20
- Docker
- SQLite

