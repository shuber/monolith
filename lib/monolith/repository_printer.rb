module Monolith
  class RepositoryPrinter
    def initialize(repos)
      @repos = repos
    end

    def print
      Formatador.display_table(repos)
    end

    private

    def repos
      @repos.map.with_index do |repo, index|
        {
          "#" => index + 1,
          "repository name" => repo.name,
          "url" => repo.url,
        }
      end
    end
  end
end
