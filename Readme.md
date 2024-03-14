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

### Running the containers for the first time

To run the Docker setup, it requires a hands-on approach to get started.

1. Clone the repository:
   ```sh
   git clone https://github.com/HotaruBlaze/NSO-RPC-Docker.git
   ```
1. Navigate to the project directory:
   ```sh
   cd NSO-RPC-Docker
   ```
1. Run:
   ```sh
   docker compose run --rm nso-rpc
   ```
   This command will automatically build (if not previously built) the NSO-RPC container and allow you to do the initial setup.

1. Follow the instructions on the prompt. If clicking on the link gives you "The request contains an error," the URL may not have been copied correctly.

1. After setting your user ID, you wont get output back. Type `Ctrl + C` to stop the container.

1. Run the following to start the containers.
   ```sh
   docker compose up -d
   ```

1. Open a web browser and go to `http://your_server_hostname:3000` or `http://your_server_ip:3000` to connect to the WebCord container.

1. Log in to Discord. If you have issues with the QR code, log in directly.

1. Once logged in, go to `File > Settings`, and make the following changes:
   - Untick "Use built-in Content Security Policy"
   - Enable Developer Mode

1. Close the settings window.

1. Restart Webcord via `File > Relaunch`.

1. Open Chrome Dev Tools in Webcord by pressing `Ctrl + Shift + I`, and then click on `Console`.

1. Now paste the contents of `webcord-hook.js` into the console and press Enter. (This script can also be found on arRPC's repo [here](https://github.com/OpenAsar/arrpc/blob/main/examples/bridge_mod.js)).

   **NOTE 1**: To be able to paste, you might need to use KasmVNC's Clipboard feature by clicking on the little arrow on the left of the screen, then clicking on "Clipboard" and pasting the `webcord-hook.js` contents inside the text box that shows up, before you're able to paste it on the console.

   **NOTE 2**: The first time you try to paste on Chrome's console, you might need to type `allow pasting` first.

**You should now be fully setup and should see Switch RPC presence on your account.**

### Subsequent runs

For subsequent runs, you only need to:

1. Run
   ```sh
   docker compose up -d
   ```
   to start the containers.

2. Login to Discord as described above.

3. Paste the `webcord-hook.js` into the Chrome Dev Tools console, as described above.

### Troubleshooting

If you're having trouble, run the following to see the NSO-RPC log:

```sh
docker compose logs nso-rpc
```

The log of a successful setup should look similar to this:

```sh
nso-rpc  | [arRPC] arRPC v3.1.0
nso-rpc  | (node:7) ExperimentalWarning: Importing JSON modules is an experimental feature and might change at any time
nso-rpc  | (Use `node --trace-warnings ...` to show where the warning was created)
nso-rpc  | [arRPC > bridge] listening on 1337
nso-rpc  | [arRPC > ipc] listening at /tmp/discord-ipc-0
nso-rpc  | [arRPC > websocket] listening on 6463
nso-rpc  | [arRPC > process] started
nso-rpc  | [arRPC > ipc] new connection!
nso-rpc  | Successfully Connected to Discord.
nso-rpc  | [arRPC > bridge] web connected
```
