FROM node:0.12

RUN apt-get update && apt-get install -y --no-install-recommends \
		libjpeg62 \
		libwebkitgtk-1.0-0 \
		openjdk-7-jre \
		sudo \
		unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN set -x && mkdir -p /opt/appcelerator/ \
	&& cd /opt/appcelerator/ \
	&& wget -nv -O appcelerator_studio.zip \
		http://go.appcelerator.com/download_appcelerator_studio_linux_64_stable \
	&& unzip appcelerator_studio.zip -d . \
	&& mv Appcelerator_Studio/ studio/ \
	&& rm -f appcelerator_studio.zip \
	&& chmod 777 studio/ studio/configuration/

RUN echo 'ALL ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/lol

ENV PATH /opt/appcelerator/studio/:$PATH

CMD ["AppceleratorStudio"]
