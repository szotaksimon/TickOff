REMOTE=dev@164.90.177.78
API_DIR=/var/www/api
SVC=tickoff_api.service

# Disable and remove previous systemd service unit
ssh $REMOTE "sudo systemctl stop $SVC && sudo systemctl disable $SVC && sudo rm /etc/systemd/system/$SVC"

# Delete remote files
ssh $REMOTE "rm -rf /var/www/api/*"

# Copy files
scp ./*.{py,ini,service,txt} $REMOTE:$API_DIR
scp ./.env $REMOTE:$API_DIR

# Create and setup virtualenv
ssh $REMOTE "cd $API_DIR && virtualenv venv && source venv/bin/activate && pip install -r requirements.txt"

# Copy and enable systemd service unit
ssh $REMOTE "sudo cp $API_DIR/$SVC /etc/systemd/system/ && sudo systemctl enable $SVC && sudo systemctl start $SVC"