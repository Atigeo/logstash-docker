#!/bin/bash
# This is the base process of the container.

# Start the service and tail logs to keep PID 1 going.
start_container() 
{
	start_service
}

# Start the service
start_service() 
{
	# Start the service
	echo -e "\n---- Luanching service ----\n"
	${LOGSTASH_HOME}/bin/logstash agent -f /etc/logstash 
}

# Stop the service
stop_service() 
{
	# Stop the service
	echo -e "\n---- Stopping service ----\n"
}


# Startup the container
if [ -z $1 ]; then
	start_container
fi

# Start
if [ "$1" == "start" ]; then 
        start_service
fi

# Stop
if [ "$1" == "stop" ]; then
        stop_service
fi

# Restart
if [ "$1" == "restart" ]; then 
	stop_service
	sleep 2
	start_service
fi
