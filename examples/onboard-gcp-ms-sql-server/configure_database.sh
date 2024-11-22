#!/bin/bash
# Creates an audit policy on an SQL Server instance using the 'sqlcmd' client

# Settings
current_directory=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
policy_sql_file="${current_directory}/configure_audit_policy.sql"

# Functions
function is_pkg_installed {
  local pkg="$1"
  if ! command -v "${pkg}" &> /dev/null
  then
    echo "Package '${pkg}' is not installed."
    echo "Please see https://learn.microsoft.com/en-us/sql/tools/sqlcmd/sqlcmd-utility for installation instructions for your OS."
    echo "Exiting..."
    exit 1
  else 
    return 0
  fi 
}

is_pkg_installed "sqlcmd"

# Create server audit with server audit specification
if [ ! -r "${policy_sql_file}" ]; then 
  echo "Unable to read ${policy_sql_file}"
  echo "Exiting..."
  exit 1
else 
  sqlcmd -S tcp:${ENDPOINT} -U ${ADMIN_USER} -P ${ADMIN_PASSWORD} -v server_audit=${SERVER_AUDIT_NAME} -v audit_spec_name=${SERVER_AUDIT_SPEC_NAME} -C < ${policy_sql_file}
fi
