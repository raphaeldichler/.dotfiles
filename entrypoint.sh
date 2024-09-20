#!/bin/bash

echo "I am root" && id

su - user

# needed to run parameters CMD
$@
