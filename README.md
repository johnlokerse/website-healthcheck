# Website Healthcheck Action

This actions checks your website if it's returning status code 200 and checks for specified text on the given page.

An example of website-healthcheck in a GitHub Action:

```yaml
name: "Check for website health and title text"

on: [push]

jobs:
  health_check_job:
    runs-on: ubuntu-latest
    name: Check for status 200 and title text "lokerse.dev"
    steps:
      - uses: actions/checkout@v2
      - id: test
        uses: johnlokerse/website-healthcheck@v2
        with:
          web-url: "https://www.lokerse.dev"
          scan-for-text: "lokerse.dev"
```
