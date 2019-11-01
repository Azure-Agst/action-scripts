#
# Start.sh
# This script restarts server multiplexer and processes within it.
#

# Prepare logging
LOGFILE=server.log
echo Server started at $(date +"%H:%M:%S on %m-%d-%Y.") > $LOGFILE

# Variables
SESSIONNAME=flaskServer
HOST=0.0.0.0
PORT=80 #443

# Set up virtualization
tmux ls | grep -Fx $SESSIONNAME
if [ $? != 0 ]; then
    echo "Existing session found! Killing..."
    tmux kill-session -t $SESSIONNAME
fi

# Run server
echo "Starting new server instance..."
tmux new-session -d -s $SESSIONNAME flask run --host $HOST --port $PORT > $LOGFILE
echo "Server started! Visit the page to run a test!"