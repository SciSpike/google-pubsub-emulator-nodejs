FROM scispike/google-pubsub-emulator:0.1.0-pre.0
LABEL version=0.1.0-pre.1

RUN   apk --update add nodejs yarn &&   yarn global add @google-cloud/pubsub

ENV NODE_PATH=/usr/local/share/.config/yarn/global/node_modules/

VOLUME /startup
COPY ./startup /startup

COPY ./init.js /init.js
COPY ./run.sh /run.sh

RUN chmod +x /init.js
RUN chmod +x /run.sh

CMD ["./run.sh"]
