# monolith

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
admin: git@github.com:some-org/admin.git
auth: git@github.com:some-org/your-auth-gem.git
users: git@github.com:some-org/users.git
```

## CLI

    monolith help

Use `bin/monolith` when developing the gem

```
Commands:
monolith config          # List all repositories configured in `monolith.yml`
monolith generate NAME   # Generate a new monolith repository NAME
monolith help [COMMAND]  # Describe available commands or one specific command
```

```bash
monolith generate your-repo-name
```

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with the version or history.
* Send me a pull request. Bonus points for topic branches.

## License

[MIT](https://github.com/shuber/monolith/blob/master/LICENSE) - Copyright © 2015 Sean Huber
