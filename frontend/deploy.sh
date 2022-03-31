REMOTE=dev@164.90.177.78
FRONTEND_DIR=/var/www/tickoff.hu

# Delete remote files
ssh $REMOTE "rm -rf $FRONTEND_DIR/*"

# Copy html files
scp ./*.html $REMOTE:$FRONTEND_DIR

# Copy resources
scp -r ./resources $REMOTE:$FRONTEND_DIR
