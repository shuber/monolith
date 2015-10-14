module Monolith
  class Generator
    extend Forwardable
    include Logger

    def_delegators :@monolith, :name, :repositories

    def initialize(monolith)
      @monolith = monolith
    end

    def clone
      repositories.each do |repo|
        log("Cloning repository #{repo.name.blue}")
        repo.clone
      end
    end

    def generate
      clone
      run_after_clone_hooks
      create_monolith
      fetch_all_remotes
      add_remotes_to_monolith
      prepare_branches_for_merge
      merge_branches_into_monolith
      remove_remotes_from_monolith
      checkout_master_on_monolith
      run_after_generate_hooks
    end

    private

    def run_after_clone_hooks
      @monolith.config.after_clone_hooks.each do |hook|
        log("Running hook #{hook.inspect}")
        system(hook)
      end
    end

    def run_after_generate_hooks
      @monolith.config.after_generate_hooks.each do |hook|
        log("Running hook #{hook.inspect}")
        system(hook, @monolith.config.path)
      end
    end

    def create_monolith
      log("Generating monolith #{name.red}")
      @monolith.create
    end

    def fetch_all_remotes
      repositories.each do |repo|
        log("Fetching #{repo.name.blue} remotes from #{repo.url.yellow}")
        repo.fetch
      end
    end

    def add_remotes_to_monolith
      repositories.each do |repo|
        log("Adding remote #{repo.name.blue} to monolith")
        @monolith.remote(repo).add
      end
    end

    def prepare_branches_for_merge
      repositories.each do |repo|
        repo.branches.each do |branch|
          if @monolith.branch?(branch.name)
            log("Preparing #{repo.name.blue} branch #{branch.name.light_magenta}")
            repo.prepare(branch)
          end
        end
      end
    end

    def merge_branches_into_monolith
      log("Merging #{branches.size.to_s.yellow} total branches")

      repositories.each do |repo|
        branches.each do |branch|
          log("Merging #{repo.name.blue} branch #{branch.light_magenta} or master")
          @monolith.merge(repo, branch)
        end
      end
    end

    def remove_remotes_from_monolith
      repositories.each do |repo|
        log("Removing remote #{repo.name.blue} from monolith")
        @monolith.remote(repo).remove
      end
    end

    def checkout_master_on_monolith
      log("Checking out monolith master branch")
      @monolith.checkout_master
    end

    def branches
      filtered_branches.sort
    end

    def filtered_branches
      unsorted_branches.select do |branch|
        @monolith.branch?(branch)
      end
    end

    def unsorted_branches
      repositories.each_with_object(Set.new) do |repo, branches|
        repo.branches.each do |branch|
          branches << branch.name
        end
      end
    end

    def log_prefix
      "==> ".green
    end
  end
end
