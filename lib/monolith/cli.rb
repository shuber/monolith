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
      @configuration ||= Configuration.new(yaml)
    end

    def yaml
      file = options.fetch(:config, "monolith.yml")
      File.read(file)
    end
  end
end
