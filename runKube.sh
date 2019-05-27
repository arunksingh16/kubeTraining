#!/bin/bash
#
# Date: 27-May-2019
# Author: Arun K Singh [arun161087@gmail.com]
# Description: Script for Kubernetes Demostration
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
#
# Copyright (c) 2019 Arun and/or its affiliates. All rights reserved.
#

${KUBECTL} create namespace wso2
${KUBECTL} create configmap logstash-conf --from-file=../configs/logstash/logstash.conf -n wso2
${KUBECTL} create configmap logstash-yml --from-file=../configs/logstash/logstash.yml -n wso2
${KUBECTL} create configmap kibana-yml --from-file=../configs/kibana/kibana.yml -n wso2
${KUBECTL} create -f centralized-logging-deployment.yaml -n wso2
${KUBECTL} create -f wso2apim-deployment.yaml -n wso2
