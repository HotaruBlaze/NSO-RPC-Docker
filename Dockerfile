# arRPC server
FROM nikolaik/python-nodejs:python3.11-nodejs21-alpine
RUN apk add git
WORKDIR /apps/
RUN git clone https://github.com/OpenAsar/arrpc.git
RUN cd arrpc && npm install

# NSO-RPC Setup
WORKDIR /apps
# It's usually a good idea to run the development branch of this currently.
RUN git clone https://github.com/MCMi460/NSO-RPC --branch development
RUN cd NSO-RPC && pip install -r client/requirements.txt
# Prevent crash due to bad folder handling
RUN mkdir -p /root/Documents/NSO-RPC

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]