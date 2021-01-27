#!/bin/bash

git init
git add -A
git remote add origin "git@github.com:{{ cookiecutter.ioc_organization }}/{{ cookiecutter.ioc_name }}.git"

git submodule add https://github.com/{{ cookiecutter.package_organization }}/{{ cookiecutter.package_repo }}
git submodule update --init --recursive

echo "Git initialized and submodule checked out."

if [ "{{ cookiecutter.initialize_environment }}" == "YES" ]; then
    bash initialize.sh || (echo "Initialization failed?" && exit 0)
fi
