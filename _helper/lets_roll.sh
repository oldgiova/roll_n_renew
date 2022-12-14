#!/bin/bash

set -e

function get_module_dir() {
  local current_dir=$1
  local secret_idp_dir="secret_idp"
  tf_module_dir=$(grep terraform -A1 secret_idp/terragrunt.hcl | sed -n 's/^.*source\s*=\s*"\([^"]*\)"/\1/p')
  echo ${tf_module_dir#../} # removes first ../
}

function increment_keys() {
  local module_dir=$1
  local main_tf=${module_dir}/main.tf
  local output_tf=${module_dir}/output.tf
  
  local curr_id=$(grep '#curr' ${main_tf} | sed -n 's/.*"key_\([[:digit:]]*\).*$/\1/p')
  echo "INFO - current id: ${curr_id}"
  local new_curr_id=$((${curr_id}+1))

  sed -i "s/key_${curr_id}/key_${new_curr_id}/" ${main_tf}
  sed -i "s/key_${curr_id}/key_${new_curr_id}/g" ${output_tf}
  echo "INFO - new current id: ${new_curr_id}"

  local prev_id=$(grep '#prev' ${main_tf} | sed -n 's/.*"key_\([[:digit:]]*\).*$/\1/p')
  echo "INFO - previous id: ${prev_id}"
  local new_prev_id=$((${prev_id}+1))

  sed -i "s/key_${prev_id}/key_${new_prev_id}/" ${main_tf}
  sed -i "s/key_${prev_id}/key_${new_prev_id}/g" ${output_tf}
  echo "INFO - new previous id: ${new_prev_id}"
}

echo "INFO - rotating credentials"
module_dir=$(get_module_dir)
increment_keys ${module_dir}

