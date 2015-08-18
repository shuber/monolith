module Monolith
  class Application < Repository
    TMP = ".monolith"

    attr_reader :config

    def initialize(path, config)
      @config = config
      super(path.to_s)
    end

    def checkout_master
      run("checkout master")
    end

    def create
      RepositoryCreator.new(self).create
    end

    def merge(repo, branch)
      BranchMerger.new(self, repo, branch).merge
    end

    def repositories
      RepositoryFinder.new(self)
    end

    def tmp
      File.join(path, TMP)
    end
  end
end
