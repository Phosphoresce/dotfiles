#!/bin/bash

file=$1
ip=$2

cat $file | nc $ip 10101
