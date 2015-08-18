module Monolith
  class BranchMerger
    extend Forwardable

    def_delegators :@monolith, :run!, :within_working_dir

    def initialize(monolith, repo, branch)
      @monolith = monolith
      @repo = repo
      @branch = branch
    end

    def merge
      within_working_dir do
        checkout
        fetch
        pull
        checkout_previous_branch
      end
    end

    private

    def checkout
      run!("branch #{@branch.name} || true")
      run!("checkout #{@branch.name}")
    end

    def fetch
      run!("fetch #{@repo.name} #{@branch.name}")
    end

    def pull
      run!("pull #{@repo.name} #{@branch.name}")
    end

    def checkout_previous_branch
      run!("checkout -")
    end
  end
end