#!/usr/bin/env bats

load ../k8s-euft/env
load common

@test "Deploying RabbitMQ helm chart" {
    helm install kubernetes -n rabbitmq
}

@test "Check RabbitMQ is deployed" {
    check_pods_are_running
}

@test "Re-run deploy on the current version" {
    # Test upgrade of the current helm with same content to ensure there is no mistakes
    helm upgrade rabbitmq kubernetes
}