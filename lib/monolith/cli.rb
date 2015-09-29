module Monolith
  class CLI < Thor
    DEFAULT = "monolith.yml"

    def self.accept_optional_config_file
      method_option :config,
        banner: "/path/to/your/config.yml",
        default: DEFAULT
    end

    desc "clone", "Clone configured repositories"
    accept_optional_config_file
    def clone
      Generator.new(monolith).clone
    end

    desc "config", "List all configured repositories"
    accept_optional_config_file
    def config
      ConfigurationPrinter.new(configuration).print
    end

    desc "generate", "Generate a new monolith from configured repositories"
    accept_optional_config_file
    def generate
      Generator.new(monolith).generate
    end

    private

    def monolith
      @monolith ||= Application.new(configuration)
    end

    def configuration
      @configuration ||= Configuration.new(yaml)
    end

    def yaml
      file = options.fetch("config")
      File.read(file)
    end
  end
end
