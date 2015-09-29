module Monolith
  class RepositoryFinder
    include Finder

    def initialize(monolith)
      @monolith = monolith
    end

    def all
      @monolith.config.repositories.map do |(name, url)|
        path = File.expand_path(name, Dir.pwd)
        Repository.new(path, url)
      end
    end
  end
end
