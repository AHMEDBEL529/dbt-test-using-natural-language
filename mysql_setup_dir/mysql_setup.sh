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

# Navigate to mysql_setup_dir directory
log "Navigating to mysql_setup_dir directory"
cd ./mysql_setup_dir

# Clone test_db repository
log "Cloning test_db repository"
git clone https://github.com/datacharmer/test_db.git

# Navigate to test_db directory
log "Navigating to test_db directory"
cd ./test_db

# Load employees.sql into MySQL
log "Loading employees.sql into MySQL"
sudo /usr/bin/mysql -u root < employees.sql

# Create dbt_user and grant all privileges on all databases
log "Creating dbt_user and granting all privileges on all databases"
sudo /usr/bin/mysql -u root -e "CREATE USER 'dbt_user'@'localhost' IDENTIFIED BY 'your_password';"
sudo /usr/bin/mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'dbt_user'@'localhost' WITH GRANT OPTION;"
sudo /usr/bin/mysql -u root -e "FLUSH PRIVILEGES;"

# Navigate back to repo dir
log "Returning to the repo dir"
cd ~/dbt-test-using-natural-language

log "Setup complete!"
