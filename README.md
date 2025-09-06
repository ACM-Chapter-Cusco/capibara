# Capibara Backend Server

## Overview

Capibara is a REST API backend server built with Go and MySQL.

## Prerequisites - Linux (Ubuntu)

Before running the Capibara server, you need to set up the development environment with Go programming language, MySQL database server, and proper environment variables.

### Installing Go

First, install Go 1.25.0 which is required to compile and run the Capibara server:

```bash
sudo rm -rf /usr/local/go
wget https://go.dev/dl/go1.25.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.25.0.linux-amd64.tar.gz
go version
```

### Installing MySQL

Next, install and configure MySQL database server that will store the application data:

```bash
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
sudo systemctl start mysql
sudo systemctl enable mysql
```

### Environment Variables

Finally, set up the required environment variables for Go development and database connection:

```bash
cat >> ~/.bashrc << 'EOF'
export PATH=$PATH:$HOME/go/bin:
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOPROXY=direct

export MODE=dev
export SERVER_HOST=localhost
export SERVER_PORT=8080

export DB_HOST=localhost
export DB_PORT=3306
export DB_NAME=capsule
export DB_USER=capsule
export DB_PASSWORD=capsule
EOF

source ~/.bashrc
```

## Installation

Once the prerequisites are installed, proceed with the following steps to set up and run the Capibara server:

### Clone Repository

Clone the Capibara repository to your home directory to get the source code and project files:

```bash
cd $HOME
git clone https://github.com/ACM-Chapter-Cusco/capibara.git
```

### Database Setup

After cloning the repository, set up the MySQL database by running the database setup script:

```bash
$HOME/capibara/database/capsule.sh
```

### Running the Server

Finally, download dependencies and start the Capibara server:

```bash
go mod download
go mod tidy
go run $HOME/capibara/cmd/server/main.go

```

### Test

Verify the server is running correctly by making a test API call:

```bash
curl -X GET http://localhost:8080/members | jq .
```
