#!/bin/bash
# Parse JMeter result file (JTL) and push metrics to Prometheus via Pushgateway

JMETER_RESULT=../reports/result.jtl
PROM_PUSHGATEWAY=http://localhost:9091

echo "Parsing JMeter results and pushing metrics..."

# Example: parse average response time from JTL
AVG_RESPONSE=$(awk -F',' 'NR>1 {sum+=$2; count++} END {print sum/count}' $JMETER_RESULT)

# Push metric to Prometheus Pushgateway
echo "api_response_time $AVG_RESPONSE" | curl --data-binary @- $PROM_PUSHGATEWAY/metrics/job/api_perf_test

echo "Metrics pushed to Prometheus successfully!"

