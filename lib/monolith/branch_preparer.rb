module Monolith
  class BranchPreparer
    extend Forwardable

    COMMIT = "Preparing branch %s for merge"

    def_delegators :@repo, :run!, :within_working_dir

    def initialize(repo, branch)
      @repo = repo
      @branch = branch
    end

    def prepare
      within_working_dir do
        checkout_branch
        hard_reset_branch
        create_subdir
        move_files_under_subdir
        commit_changes
      end
    end

    private

    def checkout_branch
      run!("branch #{@branch.name} || true")
      run!("checkout #{@branch.name}")
    end

    def hard_reset_branch
      run!("reset --hard origin/#{@branch.name}")
    end

    def create_subdir
      LoggedMkdir.new(@repo.name).mkdir
    end

    def move_files_under_subdir
      files = "ls-tree HEAD | cut -f 2"
      move = "xargs -I file git mv file #{@repo.name}/file"
      run!("#{files} | #{move}")
    end

    def commit_changes
      message = COMMIT % @branch.remote
      run!("commit -m '#{message}'")
    end
  end
end
