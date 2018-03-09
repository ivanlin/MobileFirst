FROM anapsix/alpine-java:8_jdk

RUN apk add --update nodejs nodejs-npm xdg-utils python python-dev py-pip build-base && pip install virtualenv && rm -rf /var/cache/apk/*
RUN npm install -g mfpdev-cli plugman

WORKDIR /root

RUN wget http://public.dhe.ibm.com/ibmdl/export/pub/software/products/en/MobileFirstPlatform/mobilefirst-deved-devkit-linux-8.0.0.0.bin && chmod a+x *

RUN printf '\n1\n\n\n\n' | /root/mobilefirst-deved-devkit-linux-8.0.0.0.bin

RUN rm /root/mobilefirst-deved-devkit-linux-8.0.0.0.bin

EXPOSE 9080 9090

ENTRYPOINT ["/root/MobileFirst-8.0.0.0/run.sh"]

