# Website Healthcheck Action

This actions checks your website if it's returning status code 200 and checks for specified text on the given page.
It retries the check while it gives error code for a user-defined maximum number of attempts. 
The delay between retries is also user-defined.

An example of website-healthcheck in a GitHub Action:

```yaml
name: "Check for website health and title text"

on: [push]

jobs:
  health_check_job:
    runs-on: ubuntu-latest
    name: Check for status 200 and title text "lokerse.dev", retry a maximum of 60 times with a delay of 5 seconds betweeen retry
    steps:
      - uses: actions/checkout@v2
      - id: test
        uses: bastoj/website-healthcheck@v1
        with:
          web-url: "https://www.lokerse.dev"
          scan-for-text: "lokerse.dev"
          max-attempts: 60
          retry-delay: 5s
```
