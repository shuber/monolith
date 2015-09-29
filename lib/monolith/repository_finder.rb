module Monolith
  class RepositoryFinder
    include Finder

    def initialize(monolith)
      @monolith = monolith
    end

    def all
      @monolith.config.repositories.map do |(name, url)|
        Repository.new(name, url)
      end
    end
  end
end
