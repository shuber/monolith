module Monolith
  class Repository
    extend Forwardable

    def_delegators :git, :clone, :cloned?,
                         :fetch, :run, :run!,
                         :within_working_dir

    attr_reader :path, :url

    def initialize(path, url = nil)
      @path = path
      @url = url
    end

    def branches
      BranchFinder.new(self)
    end

    def clone
      git.clone(url) unless cloned?
    end

    def name
      @path.split("/").last
    end

    def prepare(branch)
      BranchPreparer.new(self, branch).prepare
    end

    def relative_path
      @path.split("/").tap(&:shift).join("/")
    end

    def remote(repo)
      Remote.new(self, repo)
    end

    private

    def git
      @git ||= Git.new(path)
    end
  end
end
