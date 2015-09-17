# simple-dashboard
A straightforward static JS dashboard for system monitoring
[![Circle CI](https://circleci.com/gh/Lugribossk/simple-dashboard.svg?style=shield)](https://circleci.com/gh/Lugribossk/simple-dashboard)
[![Dependency Status](https://david-dm.org/Lugribossk/simple-dashboard.svg)](https://david-dm.org/Lugribossk/simple-dashboard)
[![devDependency Status](https://david-dm.org/Lugribossk/simple-dashboard/dev-status.svg)](https://david-dm.org/Lugribossk/simple-dashboard#info=devDependencies)

## Configuration

Name|Description
---|---
title|TODO
sources|.
panels|.



## Status sources

### Any
Name|Default|Description
---|---|---
type||Which kind of source this is, must be one of the types listed below, e.g. `status-code` or `vso-branches`.
title||Title displayed on status indicator, e.g. `Production Healthcheck`.
interval|60|Number of seconds between status checks.

### Dropwizard healthcheck
The status of a [Dropwizard](http://www.dropwizard.io) service's [health checks](http://www.dropwizard.io/manual/core.html#health-checks).

By default Dropwizard is not set up to allow cross-origin requests, so you will have to add a servlet filter to the admin port that does this.
TODO example.

Name|Default|Description
---|---|---
type||`dropwizard`
adminPath|None|Path to the admin port for your service, e.g. `http://localhost:8081` for a local server with the default admin settings.

### GitHub branches
All the branches of a GitHub repository. Also shows any open pull requests from those branches to master.

Can also show the [status](https://developer.github.com/v3/repos/statuses/) of the latest commit in each branch.
This is set by many build system that integrate with GitHub such as CircleCI.

Name|Default|Description
---|---|---
type||`github-branches`
owner|None|Repository owner name, i.e. the user or organization the repo is located under.
repo|None|Repository name.
token|None|Personal access token.
showStatus|false|Also show build status.

### Static message
A static message.

Name|Default|Description
---|---|---
type||`message`
status|success|How the status indicator should look, either `success`, `warning`, `danger` or `info`.
message|None|Message to display.

### Amazon Web Services status
One of the statuses from Amazon Web Services' [Service Health Dashboard](http://status.aws.amazon.com/).

Name|Default|Description
---|---|---
type||`rss-aws`
id|None|ID of the status feed to follow as seen in the RSS link, e.g. `ec2-us-east-1`.

### Response status code
Whether an arbitrary URL returned a successful status code. Any status code below 400 counts as successful.

Check that the server is set up to allow cross-origin requests.

Name|Default|Description
---|---|---
type||`status-code`
url|None|URL to request and check response status code for.
link|url|Link when clicking on the status indicator.

### Status.io
Status from a service dashboard hosted by [Status.io](http://status.io). Many web services use this for their status pages.

Name|Default|Description
---|---|---
type||`statusio`
id|None|Status.io's ID for the service you want to check, e.g. `536beeeafd254d60080002ae` for Tutum. There doesn't seem to be an easy way to find this yourself, but you can probably get it by asking customer support for the service you want to check. 
link|None|Link to the service's status page, e.g. ``http://status.tutum.co`.

### Tutum.co service
Status of a [Tutum.co](http://tutum.co) service.

Name|Default|Description
---|---|---
type||`tutum-service`
id|None|Service ID.
username|None|Tutum account username.
apiKey|None|Tutum account API key.

### Visual Studio Online branches
All the branches of a Visual Studio Online Git repository. Also shows build status of the latest commit in each branch and pull requests to master.

Name|Default|Description
---|---|---
type||`vso-branches`
account|
project|
username|
password|
repoId|

### Visual Studio Online build
Build status of the latest commit in a Visual Studio Online Git repository branch.

type||`vso-build`
branch|master|Branch to show status for.



## Complications

### Credentials

TODO

### Cross-origin requests

TODO



## Development

- TODO config file
- `npm install -g grunt-cli`
- `npm install`
- `grunt dev`
- Open `localhost:8080`

### Adding new source types

1. Create a new subclass of `Source` that overrides `getStatus()`.
2. Define its type in the configuration file by adding it as a static property on your subclass named `type`. 
3. Add it to the list in `SourceTypes`.
