#!/bin/bash

echo "Starting Deployment..."
gcloud compute scp -r * your-vm-instance:/home/user/app
gcloud compute ssh your-vm-instance --command "bash /home/user/app/scripts/start_server.sh"
echo "Deployment Finished."
