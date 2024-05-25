#!/bin/bash

ALERT_THRESHOLD=10

RECIPIENT="mostafayounis600@gmail.com"

# Check disk usage and send email alert if usage exceeds threshold
usage=$(df -H --output=pcent / | tail -n 1 | tr -d ' %')
if [ "$usage" -ge "$ALERT_THRESHOLD" ]; then
    echo "Disk usage is above $ALERT_THRESHOLD%" | mail -s "Disk Space Alert" "$RECIPIENT"
fi

