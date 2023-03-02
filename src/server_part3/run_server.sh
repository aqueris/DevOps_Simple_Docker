#!/bin/bash

spawn-fcgi -n -p 8080 -f ./server
nginx -g "daemon off;"