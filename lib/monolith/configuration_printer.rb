module Monolith
  class ConfigurationPrinter
    def initialize(config)
      @config = config
    end

    def print
      Formatador.display_table(repos)
    end

    private

    def repos
      @config.map.with_index do |(name, url), index|
        {
          "#" => index + 1,
          "repository name" => name,
          "url" => url,
        }
      end
    end
  end
end
