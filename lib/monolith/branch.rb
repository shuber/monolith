module Monolith
  class Branch
    attr_reader :name

    def initialize(repo, name)
      @repo = repo
      @name = name
    end

    def remote
      "remotes/#{@repo.name}/#{name}"
    end
  end
end
