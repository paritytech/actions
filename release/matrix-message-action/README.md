# Matrix Message github action

This is a simple github action to send messages to matrix servers.

## Usage

Sending messages requires generating of an access token, which can be done with
`curl`, and is detailed [here](https://matrix.org/docs/guides/client-server-api/).

The Room ID does not refer to the room's name, but its unique ID. In Riot, this
can be found by navigating to 'Room Settings' -> 'Advanced'.

Markdown-formatted messages are supported.

```workflow
name: Send a hello world to matrix every 5 minutes
on:
  schedule:
    - cron: '*/5 * * * *'
jobs:
  ping_matrix:
   runs-on: ubuntu-latest
   steps:
     - name: send message
       uses: s3krit/matrix-message-action@v0.0.3
       with:
         room_id: ${{ secrets.MATRIX_ROOM_ID }}
         access_token: ${{ secrets.MATRIX_ACCESS_TOKEN }}
         message: "Hello, world"
         server: "matrix.org"
```
