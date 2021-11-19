apiVersion: deploy.cloud.google.com/v1beta1
kind: DeliveryPipeline
metadata:
 name: hello-app
description: main application pipeline
serialPipeline:
 stages:
 - targetId: test
   profiles: []
 - targetId: prod
   profiles: []
---

apiVersion: deploy.cloud.google.com/v1beta1
kind: Target
metadata:
 name: test
description: test cluster
gke:
 cluster: projects/${PROJECT_ID}/locations/${REGION}/clusters/test
---

apiVersion: deploy.cloud.google.com/v1beta1
kind: Target
metadata:
 name: prod
description: production cluster
gke:
 cluster: projects/${PROJECT_ID}/locations/${REGION}/clusters/prod
requireApproval: true
