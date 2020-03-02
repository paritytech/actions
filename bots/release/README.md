# Release Bot

A Bot that publishes all pre-released, published and edited release notes to a pre-defined Matrix room.

### How to set it up for internal use:

1. Ask the Parity DevOps team for the Matrix access token of our Matrix GitHub Bot user.
2. Create a new secret called `MATRIX_ACCESS_TOKEN` under https://github.com/${github_org}/${project_name}/settings/secrets.
3. Find out the Matrix room ID of the room you want to publish the information to. Got to Settings > Advanced > nd copy the "Internal room ID".
4. Create a new secret called `MATRIX_ROOM_ID` under https://github.com/${github_org}/${project_name}/settings/secrets.
5. Create a new file
6. Copy the [`release-bot.yml`](release-bot.yml) file to `https://github.com/${github_org}/${project_name}/.github/workflows`.
