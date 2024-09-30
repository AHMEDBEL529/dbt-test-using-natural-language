#!/bin/bash

# Function to print logs with separators
log() {
    echo "=================="
    echo "$1"
    echo "=================="
}

# Update and install MySQL
log "Updating package lists"
sudo apt-get update

log "Installing MySQL server"
sudo apt-get install -y mysql-server

log "Starting MySQL service"
sudo systemctl start mysql

# Clone test_db repository
log "Cloning test_db repository"
git clone https://github.com/datacharmer/test_db.git

# Navigate to test_db directory
log "Navigating to test_db directory"
cd ./test_db

# Load employees.sql into MySQL
log "Loading employees.sql into MySQL"
/usr/bin/mysql -u root < employees.sql

# Run the test_employees_sha.sql script with timing
log "Running test_employees_sha.sql"
time mysql -t < test_employees_sha.sql

# Navigate back to home directory
log "Returning to the home directory"
cd ~

log "Setup complete!"
