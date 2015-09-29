module Monolith
  class Application < Repository
    attr_reader :config

    def initialize(config)
      @config = config
      super(config.path)
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
  end
end
