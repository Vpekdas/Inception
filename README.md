# So_Long


# Table of Contents
1. [Description](#description)
2. [Installation Instructions](#installation-instructions)
3. [Usage Instructions](#usage-instructions)
4. [Key Features](#key-features)
5. [Contribution Guidelines](#contribution-guidelines)
6. [Acknowledgments](#acknowledgments)
7. [License Information](#license-information)
8. [Contact Information](#contact-information)
9. [Project Development](#project-development)

## Description

The Inception project is a system administration and DevOps project designed to introduce you to the world of containerization and orchestration. 

The goal is to set up a fully functional multi-service infrastructure using Docker and Docker Compose (or an alternative launcher like Orb). 

This infrastructure will host essential services such as a web server, database, caching system, and more, all running in isolated containers.


## Installation Instructions


1. Install Docker and Docker Compose on your system. Alternatively, if you're using Orb, ensure it is installed and properly configured.

2. Clone the Repository
```bash
git clone https://github.com/your-repo/inception.git
cd inception
```

3. **Set Up Environment Variables**:

Create and edit the `.env` file in the `srcs` directory. This file is used to configure essential settings for the project, such as database credentials, WordPress settings, and service URLs.

You can use the provided `env-example` file as a reference. Below is an example of what your `.env` file might look like:

```properties
SQL_DATABASE=my_database
SQL_USER=my_user
SQL_PASSWORD=my_password

WP_URL=http://localhost:8080
WP_TITLE=my_inception
WP_ADMIN_USER=admin
WP_ADMIN_PASSWORD=admin_password
WP_ADMIN_EMAIL=admin@example.com
```

## Usage Instructions

1. **Start the Containers**:
   Run the following command to build and start all services:
   ```bash
   make
   ```

2. Stop the Containers: To stop all running containers, use:
   ```bash
   make down
   ```

3. Clean Up: To remove all containers and persistent data, use:
   ```bash
   make clean
   ```

4. Access the Services:
- WordPress:
Access your WordPress site at https://localhost/.
Use the admin credentials set in your .env file to log in to the admin dashboard at https://localhost/wp-admin.

- Adminer:
Manage the database using Adminer at https://localhost/adminer/.
Use the database credentials from your .env file to log in.

- Portfolio:
View the portfolio site at http://localhost:8080/.

- Redis:
Redis is running as a caching service. Check the admin profile for more details.

- FTP:
FTP access is available using the vsftpd service. Use the FTP credentials from your .env file to connect via an FTP client (e.g., FileZilla).

## Key Features

- The mandatory project requirements only included Nginx, MariaDB, and WordPress. However, I decided to go beyond these requirements and implement additional services to enhance my skills and deepen my understanding of containerization and orchestration.

- To achieve this, I focused on reading documentation and following a consistent architecture by organizing configurations and tools into dedicated tools and conf folders.

By implementing these additional services, I was able to explore new tools, improve my understanding of containerized environments, and gain hands-on experience with service orchestration.

### NGINX :
- A high-performance web server and reverse proxy.

### MARIADB :
- A robust and scalable relational database management system.

### WORDPRESS :
- A popular content management system for building websites.

### ADMINER :
- A lightweight database management tool for MariaDB.

### FTP :
- (vsftpd): A secure FTP server for file transfers.

### REDIS :
- An in-memory data structure store used for caching.

### PORTFOLIO :
- A custom portfolio website hosted as part of the project.

### PORTAINER :
- A web-based container management tool for Docker.

## Acknowledgments
Special thanks to [FirePh0enix](https://github.com/FirePh0enix): for taking the time to explain Docker Compose and helping me better understand container orchestration. 

 


## Contribution Guidelines

I welcome contributions from everyone. Here are some guidelines to follow:

1. **Fork the repository**: Start by forking the repository to your own GitHub account.

2. **Clone the repository**: Clone the forked repository to your local machine.
```bash
git clone https://github.com/Vpekdas/Inception
```

3. **Create a new branch**: Create a new branch for each feature or bug fix you're working on. Do not make changes directly on the master branch
```bash
git checkout -b your-branch-name
```

4. **Make your changes**: Make your changes in the new branch.

5. **Commit your changes**: Commit your changes regularly with clear, descriptive commit messages.
```bash
git commit -m "Your commit message"
```

6. **Push your changes**: Push your changes to your forked repository on GitHub.
```bash
git push origin your-branch-name
```

7. **Create a pull request**: Go to your forked repository on GitHub and create a new pull request against the master branch.
Please note that this project has a code of conduct, and contributors are expected to adhere to it. Any contributions you make are greatly appreciated.

## License Information

This project is licensed under the [MIT License](LICENSE).

The MIT License is a permissive license that is short and to the point. It lets people do anything they want with your code as long as they provide attribution back to you and don’t hold you liable.

For the full license text, see the [LICENSE](LICENSE) file.

## Contact Information

If you have any questions, issues, or if you want to contribute, feel free to reach out to me:

- Discord: [Captain-Plouf](https://discordapp.com/users/415118435174055947/)

## Project Development

### Development Process

I began by watching videos that compared Docker and virtual machines (VMs) to understand the differences and advantages of containerization.

Next, I followed tutorials to learn the basic Docker commands and how to work with containers effectively.

Finally, I read documentation and explored how others set up and configured services. This helped me script and automate the installation and configuration of the services included in this project.

### Challenges and Solutions

One of the main challenges I faced was that my Docker containers wouldn't build due to insufficient permissions in my configuration files or Dockerfile. After troubleshooting and researching the issue, I found solutions on Stack Overflow, which helped me resolve the problem and better understand Docker's permission requirements.

### Tools and Technologies Used

Docker

### Lessons Learned

One of the most important lessons I learned during this project is the value of carefully reading and understanding documentation. Properly reviewing official documentation and community resources helped me troubleshoot issues, configure services correctly, and deepen my understanding of containerization and orchestration.

### Future Plans

Currently, no updates are planned for this project. However, maintenance and updates will be performed as needed to ensure compatibility and functionality.

### Current Status

The project is currently complete and not in active development. However, maintenance and updates will be done as needed.

### Known Issues

There are currently no known issues. If you find a bug, please report it in the [issue tracker](https://github.com/Vpekdas/inception/issues).

### Contributing

Contributions are always welcome! See the [Contribution Guidelines](#contribution-guidelines) for more information.
