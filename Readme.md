# NSO-RPC Docker Image

This Docker image is designed to run the NSO-RPC application headlessly, such as on a VPS.

Note: I'm also not very skilled at writing documentation, but I've included the steps as best as I can to get this setup going.

## Components

- [`NSO-RPC`](https://github.com/MCMi460/NSO-RPC): Nintendo Switch RPC Client
- [`ARRPC`](https://github.com/OpenAsar/arrpc): Unofficial Discord RPC Bridge
- [`Webcord`](https://github.com/SpacingBat3/WebCord): Unofficial Discord Client

Note: Unofficial Discord clients are against Discord's Terms of Service, so use them with caution. However, this setup should be relatively safe.

## Usage

### Prerequisites
- Docker
- Docker Compose

### Running the Container

To run the Docker setup, it requires a hands-on approach to get started.

1. Clone the repository:
   ```sh
   git clone https://github.com/HotaruBlaze/NSO-RPC-Docker.git
   ```
2. Navigate to the project directory:
   ```sh
   cd NSO-RPC-Docker
   ```
3. Build the Docker image:
   ```sh
   docker build -t ghcr.io/hotarublaze/nso-rpc-docker:latest .
   ```
4. Start the Webcord service:
   ```sh
   docker-compose up -d webcord
   ```
5. Open a web browser and go to the server's IP address on port 5000, such as `http://127.0.0.1:5000` or `http://10.0.0.24:5000`.
6. Log in to Discord. If you have issues with the QR code, log in directly.
7. Once logged in, go to `File > Settings`, and make the following changes:
   - Enable Developer Mode
   - Untick "Use built-in Content Security Policy"
8. Restart Webcord via `File > Relaunch`.
9. Return to your terminal and run the following command:
   ```sh
   docker run -it --rm \
       --name nso-rpc \
       --network host \
       -v $PWD/NSO-RPC:/root/Documents/NSO-RPC \
       -e PUID=1000 \
       -e PGID=1000 \
       -e TZ=Etc/UTC \
       ghcr.io/hotarublaze/nso-rpc-docker:latest
   ```
10. Follow the instructions on screen. If clicking on the link gives you "The request contains an error," the URL may not have been copied correctly.
11. After setting your user ID, you wont get output back, wait a couple of seconds or a minute then you can stop the Docker container via `Ctrl + C`.
12. Now bring up nso-rpc with WebCord and check the logs for the NSO-RPC service:
   ```sh
   docker-compose up -d && docker-compose logs -f nso-rpc
   ```
13. You should see something like the following output:
   ```sh
nso-rpc    | [arRPC] arRPC v3.1.0
nso-rpc    | (node:7) ExperimentalWarning: Importing JSON modules is an experimental feature and might change at any time
nso-rpc    | (Use `node --trace-warnings ...` to show where the warning was created)
nso-rpc    | [arRPC > bridge] listening on 1337
nso-rpc    | [arRPC > ipc] listening at /tmp/discord-ipc-0
nso-rpc    | [arRPC > websocket] 6463 in use!
nso-rpc    | [arRPC > websocket] listening on 6464
nso-rpc    | [arRPC > process] started
nso-rpc    | [arRPC > ipc] new connection!
   ```
14. Open Chrome Dev Tools in Webcord by pressing `Ctrl + Shift + I`, and then select console, and type `allow pasting`
15. Now paste the contents of `webcord-hook.js` into the console. (This script can also be found on arRPC's repo [here](https://github.com/OpenAsar/arrpc/blob/main/examples/bridge_mod.js)).
16. Return to your console output. You should now see `[arRPC > bridge] web connected`.

**You should now be fully setup and should see Switch RPC presence on your account.**