module Monolith
  class Configuration
    def initialize(yaml)
      @yaml = yaml
    end

    def branches
      config.fetch("branches", [])
    end

    def path
      config.fetch("path")
    end

    def repositories
      config.fetch("repositories")
    end

    private

    def config
      @config ||= YAML.load(@yaml)
    end
  end
end
