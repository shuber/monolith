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
        checkout_branch
        fetch_and_pull_branch
        checkout_previous_branch
      end
    end

    private

    def checkout_branch
      run!("branch #{@branch} || true")
      run!("checkout #{@branch}")
    end

    def fetch_and_pull_branch
      run!("fetch #{@repo.name} #{@branch}")
      run!("pull #{@repo.name} #{@branch}")
    rescue
      run!("fetch #{@repo.name} master")
      run!("pull #{@repo.name} master")
    ensure
      run!("commit --amend -m '[monolith] Merging #{@repo.name}/master'")
    end

    def checkout_previous_branch
      run!("checkout -")
    end
  end
end
