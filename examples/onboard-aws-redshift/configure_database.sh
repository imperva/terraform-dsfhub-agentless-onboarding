#!/bin/bash
# Creates an audit pull user on a Redshift cluster using the 'psql' client

# Settings
current_directory=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
user_sql_file="${current_directory}/configure_audit_pull_user.sql"

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

is_pkg_installed "psql"

# Create audit pull user
if [ ! -r "${user_sql_file}" ]; then 
  echo "Unable to read ${user_sql_file}"
  echo "Exiting..."
  exit 1
else 
    echo "Creating audit pull user..."
    PGPASSWORD="${ADMIN_PASSWORD}" psql -h "${HOSTNAME}" -p "${PORT}" -U "${ADMIN_USER}" -d "${DATABASE}" -v username="${AUDIT_PULL_USERNAME}" -v password="${AUDIT_PULL_PASSWORD}" -f "${user_sql_file}"
fi
