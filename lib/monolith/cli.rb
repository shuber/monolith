module Monolith
  class CLI < Thor
    desc "config", "List all repositories configured in `monolith.yml`"
    option :config
    def config
      ConfigurationPrinter.new(configuration).print
    end

    desc "generate NAME", "Generate a new monolith repository NAME"
    option :config
    def generate(name)
      monolith = Application.new(name, configuration)
      Generator.new(monolith).generate
    end

    private

    def configuration
      yaml = File.read(file)
      YAML.load(yaml)
    end

    def file
      options.fetch(:config, "monolith.yml")
    end
  end
end
