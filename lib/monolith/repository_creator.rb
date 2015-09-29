module Monolith
  class RepositoryCreator
    extend Forwardable

    BRANCH = "monolith"
    COMMIT = "[monolith] Initial commit"

    def_delegators :@repo, :run!, :within_working_dir

    def initialize(repo)
      @repo = repo
    end

    def create
      within_working_dir do
        initialize_git_repo
        generate_first_commit
        checkout_monolith_branch
      end
    end

    private

    def initialize_git_repo
      run!("init .")
    end

    def generate_first_commit
      run!("commit --allow-empty -m '#{COMMIT}'")
    end

    def checkout_monolith_branch
      run!("checkout -b #{BRANCH}")
    end
  end
end
