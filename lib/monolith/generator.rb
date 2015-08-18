module Monolith
  class Generator
    extend Forwardable
    include Logger

    def_delegators :@monolith, :name, :repositories

    def initialize(monolith)
      @monolith = monolith
    end

    def generate
      log("Generating monolith #{name.red}")
      @monolith.create

      repositories.each do |repo|
        puts "\n"
        log("Cloning repository #{repo.name.blue}")
        repo.clone

        log("Adding remote #{repo.name.blue} to monolith")
        @monolith.remote(repo).add

        log("Fetching #{repo.name.blue} remotes from #{repo.url.yellow}")
        repo.fetch

        # TODO: If repos don't have some-new-feature branch, merge master instead
        repo.branches.each do |branch|
          log("Preparing #{repo.name.blue} branch #{branch.name.light_magenta}")
          repo.prepare(branch)

          log("Merging #{repo.name.blue} branch #{branch.name.light_magenta}")
          @monolith.merge(repo, branch)
        end

        log("Removing remote #{repo.name.blue} from monolith")
        @monolith.remote(repo).remove
      end

      @monolith.checkout_master
    end

    private

    def log_prefix
      "==> ".green
    end
  end
end
