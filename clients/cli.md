## CLI client

### Language

For the CLI client, it would be nice to be installable very easily and
to not depend on any language version, or special system configuration.
We have several options here:

1. We can write it in Ruby:

pros:
- easy to write, has mature tools
- most of our customers knows how to install it
- easy installation method

cons:

- it depends on an installed ruby version

```
gem install semaphore-cli
```

2. We could write it in Elixir:

pros:
- we want to become an elixir company

cons:
- there is no mature cli tool probably, we would need to write it from scratch probably
- would require the installation of the erlang vm which is not widely available

3. Alternatives, such as Go:

pros:
- small and fast binary that does not depend on external languages

cons:
- we don't know how to write Go, the project could rot very fast
- no easy installation method. Best options is to follow hub's example.

### Interface

I very much like the interface offered by tools like Heroku and Kubernetes, they
have however different approaches.

Heroku like approach would be (I need to double check this):

```
$ semaphore project:list --org "renderedtext" --name "semaphore"
$ semaphore shared-config:create --name "Team Awesome" --description "Product team"
$ semaphore team:update --id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2" --name "Team Mega Awesome"
$ semaphore team:delete --id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore team:show --id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore team:connect --to project --team-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2" --project-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore team:disconnect --to project --team-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2" --project-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
```

Kubernetes like approach:

```
$ semaphore list project --org "renderedtext" --name "semaphore"
$ semaphore create team --name "Team Awesome" --description "Product team"
$ semaphore update team --id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2" --name "Team Mega Awesome"
$ semaphore delete team --id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore show team --id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore connect team project --team-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2" --project-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore disconnect team project --team-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2" --project-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"

or:

$ semaphore list projects
$ semaphore create -f team.yml
$ semaphore update -f team.yml
$ semaphore delete team --id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore show team --id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore connect team project --team-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2" --project-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
$ semaphore disconnect team project --team-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2" --project-id "b03366a5-7c2a-4d9e-968d-6a3be3e4d0f2"
```

I like the kubernetes approach.

## Login

A good CLI tool should allow me to login to semaphore.

```
$ semaphore login
username: <username>
password: <password>
2fa: <2fa>
```

And to store the auth token somewhere on my system. Github's hub has a very good
example of this workflow.

## Discovery

A good CLI should allow me to explore it, without looking up the docs:

```
$ semaphore

Commands:
  semaphore list <resource> <params>
  semaphore create <resource> <params>
  semaphore update <resource> <params>
  semaphore connect <resource_a> <resource_b> <resource_a_id> <resource_b_id>

Resources:
  orgs - http://semaphoreci.com/docs/api-v2-orgs.html
  teams - http://semaphoreci.com/docs/api-v2-teams.html
  shared-configs - http://semaphoreci.com/docs/api-v2-shared-configs.html
```

and to help with subcommands:

```
$ semaphore help list projects
Usage: semaphore list logs [flags]

List projects on Semaphore.

Flags:
 --org-id   organization
 --team-id  team
 --name     name of the project
```

## Versioning

We don't have subversions in our current API v2, so we would need to either
introduce them or to use separate versions for the client.
