#!/bin/bash
set -e

docker run -it --rm \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v "$HOME:$HOME" \
	-w "$HOME" \
	-e DISPLAY="unix$DISPLAY" \
	-e HOME \
	knickers/appcelerator-studio "$@"
