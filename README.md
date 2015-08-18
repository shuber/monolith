# monolith

Generates a single monolithic repository from a list of other git repositories

## How does it work?

> http://www.harecoded.com/merging-two-three-or-more-git-repositories-keeping-the-log-history-2366393

TODO: summarize the instructions from the url above

## Installation

    gem install monolith

## Usage

Create a `monolith.yml` file in your working directory with a list of repositories

```yaml
admin: git@github.com:some-org/admin.git
auth: git@github.com:some-org/your-auth-gem.git
users: git@github.com:some-org/users.git
```

## CLI

    monolith help

Use `bin/monolith` instead when developing

```
Commands:
monolith config          # List all repositories configured in `monolith.yml`
monolith generate NAME   # Generate a new monolith repository NAME
monolith help [COMMAND]  # Describe available commands or one specific command
```

    monolith generate your-repo-name
