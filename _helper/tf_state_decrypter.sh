#!/bin/bash

set -x

ROOT_FOLDER=$1
MYSTIKO_PREFIX="oldgiova/"

for FOLDER in secret_idp secret_target; do
  pass show ${MYSTIKO_PREFIX}${ROOT_FOLDER}/${FOLDER}/terraform.tfstate > ${FOLDER}/terraform.tfstate
done
