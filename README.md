# Strapi Docker Application

A fully containerized Strapi CMS application using Docker and Docker Compose, making it easy to deploy and run Strapi locally or in production.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Docker Commands](#docker-commands)
- [Project Structure](#project-structure)
- [Environment Variables](#environment-variables)
- [Troubleshooting](#troubleshooting)
- [Technologies Used](#technologies-used)

## 🎯 Overview

This project demonstrates how to containerize a Strapi application using Docker. Strapi is a leading open-source headless CMS that's highly customizable and developer-friendly.

## ✨ Features

- 🐳 **Fully Dockerized** - Complete Docker setup with multi-stage builds
- 🚀 **Easy Setup** - Get started with just a few commands
- 💾 **SQLite Database** - Lightweight database included (easily switchable to PostgreSQL)
- 🔄 **Hot Reload** - Development mode with live code reloading
- 📦 **Volume Mapping** - Persistent data storage
- 🔒 **Secure** - Environment variables for sensitive configuration

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Docker Desktop** (version 20.10 or higher)
  - [Download for Mac](https://www.docker.com/products/docker-desktop/)
  - [Download for Windows](https://www.docker.com/products/docker-desktop/)
  - [Download for Linux](https://docs.docker.com/desktop/install/linux-install/)
- **Git** (for cloning the repository)
- **Node.js 20+** (only if running without Docker)

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/strapi-docker-app.git
cd strapi-docker-app
```

### 2. Build the Docker Image

```bash
docker-compose build
```

This will:
- Download the Node.js 20 Alpine base image
- Install all Strapi dependencies
- Build the Strapi admin panel
- Create an optimized Docker image

### 3. Start the Application

```bash
docker-compose up -d
```

The `-d` flag runs containers in detached mode (in the background).

### 4. Access Strapi

Open your browser and navigate to:

**Admin Panel:** [http://localhost:1337/admin](http://localhost:1337/admin)

On first launch, you'll be prompted to create your first administrator account.

## 💻 Usage

### Creating Your First Admin User

1. Go to [http://localhost:1337/admin](http://localhost:1337/admin)
2. Fill in the admin registration form:
   - First Name
   - Last Name
   - Email
   - Password
3. Click "Let's start"

### Creating Content Types

1. Navigate to **Content-Type Builder** in the admin panel
2. Click **"Create new collection type"**
3. Define your content structure
4. Save and the server will automatically restart

### Accessing the API

Once you create content types and add data:

**API Endpoint:** `http://localhost:1337/api/[collection-name]`

Example: `http://localhost:1337/api/articles`

## 🐳 Docker Commands

### Start the Application

```bash
docker-compose up -d
```

### Stop the Application

```bash
docker-compose down
```

### View Logs

```bash
# Follow logs in real-time
docker-compose logs -f strapi

# View last 100 lines
docker-compose logs --tail=100 strapi
```

### Restart the Application

```bash
docker-compose restart
```

### Rebuild After Code Changes

```bash
docker-compose up -d --build
```

### Stop and Remove Everything (including volumes)

```bash
docker-compose down -v
```

**⚠️ Warning:** This will delete all your data!

### Access Container Shell

```bash
docker-compose exec strapi sh
```

### Check Running Containers

```bash
docker ps
```

## 📁 Project Structure

```
strapi-docker-app/
├── config/              # Strapi configuration files
├── src/                 # Source code
│   ├── api/            # API endpoints
│   ├── components/     # Reusable components
│   └── extensions/     # Plugin extensions
├── public/             # Public assets
│   └── uploads/        # Uploaded files
├── .tmp/               # Temporary files and SQLite database
├── node_modules/       # Dependencies (not in git)
├── Dockerfile          # Docker image configuration
├── docker-compose.yml  # Docker Compose configuration
├── .dockerignore       # Files to exclude from Docker build
├── package.json        # NPM dependencies
└── README.md          # This file
```

## 🔐 Environment Variables

The application uses the following environment variables (configured in `docker-compose.yml`):

| Variable | Description | Default |
|----------|-------------|---------|
| `NODE_ENV` | Environment mode | `development` |
| `HOST` | Host address | `0.0.0.0` |
| `PORT` | Port number | `1337` |
| `APP_KEYS` | Application keys for security | Generated |
| `API_TOKEN_SALT` | Salt for API tokens | Generated |
| `ADMIN_JWT_SECRET` | JWT secret for admin | Generated |
| `TRANSFER_TOKEN_SALT` | Salt for transfer tokens | Generated |
| `JWT_SECRET` | General JWT secret | Generated |

**⚠️ Important:** For production, generate secure random strings for all secrets!

### Generate Secure Secrets

```bash
# On Mac/Linux
openssl rand -base64 32
```

## 🐛 Troubleshooting

### Port 1337 Already in Use

```bash
# Find process using port 1337
lsof -i :1337

# Kill the process (replace PID with actual process ID)
kill -9 PID
```

### Docker Build Fails

```bash
# Clean Docker cache and rebuild
docker-compose down
docker system prune -a
docker-compose build --no-cache
docker-compose up -d
```

### Container Keeps Restarting

```bash
# Check logs for errors
docker-compose logs strapi

# Common issues:
# - Missing environment variables
# - Port conflicts
# - Insufficient memory
```

### Permission Issues

```bash
# Fix ownership of files (Mac/Linux)
sudo chown -R $(whoami) .
```

### Database Connection Issues

The default setup uses SQLite. If you need PostgreSQL:

1. Update `docker-compose.yml` to include PostgreSQL service
2. Add database environment variables
3. Rebuild: `docker-compose up -d --build`

## 🛠️ Technologies Used

- **[Strapi](https://strapi.io/)** - Headless CMS (v5.35.0)
- **[Node.js](https://nodejs.org/)** - JavaScript runtime (v20)
- **[Docker](https://www.docker.com/)** - Containerization platform
- **[Docker Compose](https://docs.docker.com/compose/)** - Multi-container orchestration
- **[SQLite](https://www.sqlite.org/)** - Embedded database
- **[Alpine Linux](https://alpinelinux.org/)** - Lightweight container OS

## 📝 Development

### Running Without Docker

If you prefer to run without Docker:

```bash
# Install dependencies
npm install

# Run in development mode
npm run develop

# Build for production
npm run build

# Start production server
npm start
```

### Making Changes

1. Modify files in `src/`, `config/`, etc.
2. Strapi will auto-reload in development mode
3. For Docker, rebuild if you change dependencies:
   ```bash
   docker-compose up -d --build
   ```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- [Strapi Team](https://strapi.io/) for the amazing CMS
- [Docker](https://www.docker.com/) for containerization technology
- Open source community

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Troubleshooting](#troubleshooting) section
2. Review [Strapi Documentation](https://docs.strapi.io/)
3. Check [Docker Documentation](https://docs.docker.com/)
4. Open an issue in this repository

---

**Made with ❤️ using Strapi and Docker**

🌟 If you find this project helpful, please give it a star!
