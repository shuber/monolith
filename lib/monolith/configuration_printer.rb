module Monolith
  class ConfigurationPrinter
    def initialize(config)
      @config = config
    end

    def print
      Formatador.display_table([path: @config.path])
      Formatador.display_table(repositories)
      Formatador.display_table(branches) unless branches.empty?
    end

    private

    def branches
      @config.branches.map.with_index do |name, index|
        {
          "#" => index + 1,
          "branch name" => name,
        }
      end
    end

    def repositories
      @config.repositories.map.with_index do |(name, url), index|
        {
          "#" => index + 1,
          "repository name" => name,
          "url" => url,
        }
      end
    end
  end
end
