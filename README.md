# Github Actions

A collection of custom GitHub actions and examples.

## GHA Directory

-   `Download` from `Wilfried Kopp <chevdor@gmail.com>`: Download artifacts

-   `Upload` from `Wilfried Kopp <chevdor@gmail.com>`: Upload artifacts

-   `matrix-message` from `Martin Pugh (pugh@s3kr.it)`: Send a message to a matrix channel

## matrix-message

Send a message to a matrix channel

### Inputs

-   `access_token`: Access token required to send to matrix server

-   `message`: Message to send in plaintext format

-   `room_id`: Matrix room ID, specified in channels advanced settings

-   `[server]`: Matrix server hostname

### Outputs

No outputs.

## Download

Download artifacts

### Inputs

-   `chain`: Name of the chain, ie. polkadot

### Outputs

-   `[json]`: Foobar

## Upload

Upload artifacts

### Inputs

-   `arch`: arch

-   `file`: input file

-   `[md5]`: Should generate a md5 checksum ?

-   `project`: Project

-   `public`: Whether the artifacts should be uploaded as public or not. Please note that some backends do not allow private uploads.

-   `[sha256]`: Should generate a sha256 checksum ?

-   `version`: version

### Outputs

-   `[url]`: URL of the uploaded artifact
