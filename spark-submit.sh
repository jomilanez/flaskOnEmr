#!/bin/bash

set -x -e

aws s3 cp s3://josi-test/application.py .
spark-submit application.py


