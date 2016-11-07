#!/bin/bash

file=$1

nc -l 10101 > $file
