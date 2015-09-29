module Monolith
  class Branch
    attr_reader :name

    def initialize(repo, name)
      @repo = repo
      @name = name
    end

    def path
      [@repo.name, name].join("/")
    end

    def remote
      ["remotes", path].join("/")
    end
  end
end
