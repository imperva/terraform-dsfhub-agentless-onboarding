#!/bin/bash
# Configures Google Postgresql database for auditing by connecting to the 
# database using 'psql'
# 
# Connection to the database uses PG environment variables
# See postgres documentation for more information: 
# https://www.postgresql.org/docs/current/libpq-envars.html
################################################################################

# Settings
current_directory=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
sql_file="${current_directory}/configure_database.sql"

# Functions
function is_pkg_installed {
  local pkg="$1"
  if ! command -v "${pkg}" &> /dev/null
  then
    echo "Package '${pkg}' is not installed."
    echo "Install on MacOS:  brew install libpq"
    echo "Install on Ubuntu: apt-get install -y libpq-dev"
    echo "Install on CentOS: yum install -y libpq"
    echo "Exiting..."
    exit 1
  else 
    return 0
  fi 
}

################################################################################
is_pkg_installed "psql"
if [ ! -r "${sql_file}" ]; then 
  echo "Unable to read ${sql_file}"
  echo "Exiting..."
  exit 1
else 
  psql --file="${sql_file}"
fi
