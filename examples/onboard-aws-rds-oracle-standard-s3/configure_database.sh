#!/bin/bash
# Creates an audit policy on an Oracle instance using 'sqlplus'

# Settings
current_directory=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
policy_sql_file="${current_directory}/configure_audit_policy.sql"

# Functions
function is_pkg_installed {
  local pkg="$1"
  if ! command -v "${pkg}" &> /dev/null
  then
    echo "Package '${pkg}' is not installed."
    echo "Exiting..."
    exit 1
  else 
    return 0
  fi 
}

is_pkg_installed "sqlplus"

# Create audit policy
if [ ! -r "${policy_sql_file}" ]; then 
  echo "Unable to read ${policy_sql_file}"
  echo "Exiting..."
  exit 1
else 
  sqlplus ${ADMIN_USER}/${ADMIN_PASSWORD}@${HOSTNAME}/${SID}:${PORT} @${policy_sql_file}
fi
