# JFrog CLI for GitHub Actions v2

This action provides a wrapper around the [JFrog CLI](https://www.jfrog.com/confluence/display/CLI/CLI+for+JFrog+Artifactory). It will execute whatever CLI commands your workflow defines, and can use any of the three authentication methods available to the CLI.

This action only supports [JFrog Artifactory](https://jfrog.com/artifactory/) commands at this time.

## Usage

This action requires several environment variables to operate: the URL for your Artifactory instance, the type of authentication you wish to use, and the credentials for your authentication method.

### Required Variables

| Variable   | Value      |
| ------------- |:-------------:|
| AUTH       | apikey, username, or accesstoken        |
| URL        | The URL for your Artifactory instance   |

### Authentication Variables

| Auth Method   | Variable      |
| ------------- |:-------------:|
| API Key       | APIKEY        |
| Access Token  | TOKEN         |
| Login Credentials | USER and PASS |

**All environment variables other than AUTH must be set as secrets.**

## Example Workflow

The following workflow simply pings your defined Artifactory instance to confirm it is operational. It uses the API key authentication method.

```
name: JFrog CLI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Ping Artifactory
        uses: katcosgrove/jfrog-actions@master
        with:
            cmd: 'ping'
        env:
            auth: ${{ secrets.AUTH }}
            apikey: ${{ secrets.APIKEY }}
            url: ${{ secrets.URL }}
```
