#!/bin/sh
docker build -t xulq/complexk8s-client:latest -t xulq/complexk8s-client:$SHA -f ./client/Dockerfile ./client
docker build -t xulq/complexk8s-server:latest -t xulq/complexk8s-server:$SHA -f ./server/Dockerfile ./server
docker build -t xulq/complexk8s-worker:latest -t xulq/complexk8s-worker:$SHA -f ./worker/Dockerfile ./worker
docker push xulq/complexk8s-client
docker push xulq/complexk8s-server
docker push xulq-complexk8s-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=xulq/complexk8s-server
