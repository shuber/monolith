module Monolith
  class RepositoryCreator
    extend Forwardable

    BRANCH = "monolith"
    COMMIT = "Initial monolith commit"
    IGNORE = ".gitignore"
    TMP = ".monolith"

    def_delegators :@repo, :run!, :within_working_dir

    def initialize(repo)
      @repo = repo
    end

    def create
      within_working_dir do
        initialize_git_repo
        ignore_tmp_directory
        generate_first_commit
        checkout_monolith_branch
      end
    end

    private

    def initialize_git_repo
      run!("init .")
    end

    def ignore_tmp_directory
      File.open(IGNORE, "w") do |file|
        file.write(TMP)
      end
    end

    def generate_first_commit
      run!("add #{IGNORE}")
      run!("commit -m '#{COMMIT}'")
    end

    def checkout_monolith_branch
      run!("checkout -b #{BRANCH}")
    end
  end
end
