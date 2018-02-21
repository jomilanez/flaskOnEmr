#!/usr/bin/env bash
##!/bin/bash
aws emr create-cluster \
--applications Name=Hadoop Name=Spark Name=Zeppelin Name=Ganglia \
--bootstrap-actions '[{"Path":"s3://josi-test/bootstrap.sh","Name":"configure_cluster"}]' \
--tags 'application=flaskOnEmr' \
--ec2-attributes '{"KeyName": "josiane.python","InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-210b5f78","EmrManagedSlaveSecurityGroup":"sg-be69e6c4","EmrManagedMasterSecurityGroup":"sg-5463ec2e","AdditionalMasterSecurityGroups":["sg-ea6ee190"],"AdditionalSlaveSecurityGroups":["sg-ea6ee190"]}' \
--service-role EMR_DefaultRole \
--release-label emr-5.11.1 \
--configurations 'https://s3-eu-west-1.amazonaws.com/josi-test/emr-configuration.json' \
--instance-groups 'https://s3-eu-west-1.amazonaws.com/josi-test/instance_group.json' \
--log-uri 's3n://josi-test/emr-logs/' \
--name 'Flask on EMR' \
--auto-scaling-role EMR_AutoScaling_DefaultRole \
--steps Name=ModelCreation,Jar=s3://eu-west-1.elasticmapreduce/libs/script-runner/script-runner.jar,Args=[s3://josi-test/spark-submit.sh] \
--region eu-west-1