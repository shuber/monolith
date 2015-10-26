# [![Sean Huber](https://cloud.githubusercontent.com/assets/2419/6550752/832d9a64-c5ea-11e4-9717-6f9aa6e023b5.png)](https://github.com/shuber) monolith

[![Code Climate](https://codeclimate.com/github/shuber/monolith/badges/gpa.svg)](https://codeclimate.com/github/shuber/monolith) [![Gem Version](https://badge.fury.io/rb/monolith.svg)](http://badge.fury.io/rb/monolith)

Generates a single monolithic repository from a list of other git repositories

## Why?

* [Google Is 2B Lines of Code, All in One Place](https://news.ycombinator.com/item?id=10227000)
* [On Monolithic Repositories](https://news.ycombinator.com/item?id=10007654)
* [Advantages of Monolithic Version Control](https://news.ycombinator.com/item?id=9562923)

## How?

* [Merging two, three or more git repositories keeping the log history](http://www.harecoded.com/merging-two-three-or-more-git-repositories-keeping-the-log-history-2366393)


## Installation

```bash
gem install monolith
```

## Usage

Create a `monolith.yml` file in your working directory with a list of repositories

```yaml
path: /path/to/your/new/monolith

repositories:
  admin: git@github.com:some-org/admin.git
  auth: git@github.com:some-org/your-auth-gem.git
  users: git@github.com:some-org/users.git

# Optional whitelist of branches to clone. By default,
# ALL branches are imported into the monolith.
branches:
  - master

# Optional list of commands to run right after
# all of the repositories above have been cloned.
#
# These are handy for things like rewriting history
# to remove large unused files or sensitive information.
after_clone:
  - ./remove_all_unused_large_files

# Optional list of commands to run after the monolith
# has been generated.
#
# These hooks are handy for things like introducing new top-level
# config files for services like Heroku, CodeClimate, CircleCI, etc.
after_generate:
  - ./add_global_gitignore
  - ./add_global_slugignore
```

Use the `monolith` command to generate a repository at `/path/to/your/new/monolith`

```bash
monolith generate
```

See `monolith help` for a list of other commands

```
Commands:
monolith clone           # Clone configured repositories
monolith config          # List all configured repositories
monolith generate        # Generate a new monolith from configured repositories
monolith help [COMMAND]  # Describe available commands or one specific command
```

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with the version or history.
* Send me a pull request. Bonus points for topic branches.

## License

[MIT](https://github.com/shuber/monolith/blob/master/LICENSE) - Copyright © 2015 Sean Huber
