module Monolith
  class Configuration
    def initialize(yaml)
      @yaml = yaml
    end

    def after_clone_hooks
      config.fetch("after_clone", [])
    end

    def after_generate_hooks
      config.fetch("after_generate", [])
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
