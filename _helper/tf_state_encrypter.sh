#!/bin/bash

set -x

ROOT_FOLDER=$1
MYSTIKO_PREFIX="oldgiova/"

for FOLDER in secret_idp secret_target; do
  cat ${FOLDER}/terraform.tfstate | pass insert -m ${MYSTIKO_PREFIX}${ROOT_FOLDER}/${FOLDER}/terraform.tfstate
  rm ${FOLDER}/terraform.tfstate
done
