#!/bin/bash

mysql -h localhost -p -u monty test < misc/mysql/init-db.sql

../../util/import-model.pl --reset --user monty \
    --password some_pass --server localhost \
    --model posts Post.json

../../util/import-model.pl --reset --user monty \
    --password some_pass --server localhost \
    --model comments Comment.json

