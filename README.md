
# dbt Test Using Natural Language

Welcome to your new dbt project!

## Setup Instructions

1. Clone the repository:
    ```bash
    git clone https://github.com/AHMEDBEL529/dbt-test-using-natural-language.git
    ```
2. Navigate to the project directory:
    ```bash
    cd dbt-test-using-natural-language/
    ```
3. Set execute permissions for the MySQL setup script:
    ```bash
    chmod +x ./mysql_setup_dir/mysql_setup.sh
    ```
4. Run the MySQL setup script:
    ```bash
    ./mysql_setup_dir/mysql_setup.sh
    ```
5. Install Python virtual environment tools:
    ```bash
    apt install python3.12-venv
    ```
6. Create and activate a Python virtual environment:
    ```bash
    python3 -m venv .venv
    source .venv/bin/activate
    ```
7. Install dbt core and MySQL adapter:
    ```bash
    python3 -m pip install dbt-core dbt-mysql
    ```
8. Run dbt:
    ```bash
    dbt run
    ```
