#!/bin/bash
# Automate performance tests + monitoring in CI/CD pipeline

echo "Starting CI/CD Performance Test Pipeline..."

# Run Dockerized JMeter tests
./scripts/run_tests.sh

# Push metrics to Prometheus
./scripts/run_monitoring.sh

echo "Pipeline completed. Check Grafana dashboard for metrics."
