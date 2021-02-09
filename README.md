"# repository-dispatch" 

![CI checks](https://github.com/jduimovich/repository-dispatch/workflows/CI%20checks/badge.svg)

`repository-dispatch` is a GitHub Action to trigger a workflow based on a user defined event. This action uses the [repository dispatch mechanism](https://docs.github.com/en/actions/reference/events-that-trigger-workflows) from Github Actions.

The trigger side definition is as follows. 

```yaml
  trigger:
    runs-on: ubuntu-latest
    name: Triggers a workflow via a user-defined-event
    steps: 
      - name: Checkout to test
        uses: actions/checkout@v2
      - name: Run local action
        uses: ./  
        id: dispatch
        with:
          github-token: ${{ secrets.MY_TOKEN }}  
          event-to-dispatch: user-defined-event
```

Define a workflow which uses  repository_dispatch, 

```yaml 
# CI checks. This will pass when the user defined event is trigged by the CI Task. Note the name  `user-defined-event` is an example name, users can define their own named events. 

name: CI checks
on:
  repository_dispatch:
    types: [user-defined-event]
jobs:
  shell:
    name: Simple shell to validate repository-dispatch
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2   
    - name: Shell test 
      run: |  
        ls -al 
```
