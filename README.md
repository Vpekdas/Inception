# Inception

## Table of Contents
1. [Description](#description)
2. [Installation](#installation)
3. [Run](#run)
4. [Credits](#credits)
5. [Contributing](#contributing)
6. [License](#license)

## Description

Inception is a project from the 42 Common Core curriculum. The goal is to create a Dockerized environment with multiple services, each running in its own container. The project restricts us from using existing images, so we must build each container from scratch. Below, you'll find a description of each service and its purpose.

### Purpose

| **Service** | **Purpose** |
|:-------------:|-------------|
| **Nginx**   | Acts as a reverse proxy, routing incoming HTTP requests to the appropriate service (WordPress, Adminer, Portainer) based on the requested URL. |
| **MariaDB** | Serves as the database, storing WordPress site data such as posts, pages, comments, and settings. |
| **WordPress** | Content management system (CMS) for creating and managing pages, posts, users, and customizing site content. |
| **Redis**   | Caching system for WordPress. By caching requests, Redis helps improve performance and reduces response time. |
| **Adminer** | Database management tool that provides a user-friendly GUI for managing the database, eliminating the need for manual SQL queries. |
| **vsftpd**  | FTP server for transferring files between the Docker containers and a local machine. |
| **Portfolio** | Hosts a static website using Node.js and Express. |
| **Portainer** | A management platform that provides a simple GUI for managing and monitoring Docker containers, making container operations easier. |

### Technologies used

- **Docker** : For writing custom Dockerfiles and managing multi-container setups using Docker Compose.  
- **Bash** : For scripting tasks such as container setup and automation.

### Challenges and Future Features

One of the main challenges was understanding the differences between Docker and virtual machines. I also had to learn how to write Dockerfiles and docker-compose.yml files, as well as debug issues with each services.

I'm not planning to add more containers or new features.

## Installation

- Ensure [Docker](https://www.docker.com/) is installed. You can verify this running the command below.
```bash
docker --version
```
- Make sure you have created a .env at ./inception/srcs. You can find an env example is same folder.

## Run

The makefile on project root has 3 rules:

1. Install and run all Docker containers:
```bash
make
```
2. Stop all running Docker containers:
```bash
make down
```
3. Stop and remove all Docker containers:
```bash
make clean
```

You can find below how to use every container:

| **Service** | **How to access** |
|:-------------:|-------------|
| **Wordpress** | Access your WordPress site at https://localhost/. Use the admin credentials set in your .env file to log in to the admin dashboard at https://localhost/wp-admin. |
| **Adminer**   | Manage the database using Adminer at https://localhost/adminer/. Use the database credentials from your .env file to log in. |
| **Portfolio** | View the portfolio site at http://localhost:8080/. |
| **Redis**     | Redis is running as a caching service. Check the admin profile for more details through Wordpress. |
| **vsftpd**    | FTP access is available using the vsftpd service. Use the FTP credentials from your .env file to connect via an FTP client (e.g., FileZilla). |

## Credits

A special thanks to FirePh0enix [FirePh0enix](https://github.com/FirePh0enix) for his help in understanding how Docker Compose works.

## Contributing

To report issues, please create an issue here:  [issue tracker](https://github.com/Vpekdas/inception/issues).

To contribute, follow these steps:

1. **Fork the repository**: Start by forking the repository to your own GitHub account.

2. **Clone the repository**: Clone the forked repository to your local machine.
```bash
git clone https://github.com/Vpekdas/Inception
```

3. **Create a new branch**: Create a new branch for each feature or bug fix you're working on.
```bash
git checkout -b your-branch-name
```

4. **Commit your changes**: Commit your changes.
```bash
git commit -m "Your commit message"
```

5. **Push your changes**: Push your changes to your forked repository on GitHub.
```bash
git push origin your-branch-name
```

6. **Create a pull request**: Go to your forked repository on GitHub and create a new pull request against the master branch.

## License

This project is licensed under the [MIT License](LICENSE).
