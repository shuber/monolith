module Monolith
  class Git
    include Logger

    def initialize(path)
      @path = path
    end

    def clone(url)
      run("clone #{url} .")
    end

    def cloned?
      File.exists?(@path)
    end

    def fetch
      run("fetch --all")
    end

    def run(cmd)
      within_working_dir do
        run!(cmd)
      end
    end

    def run!(cmd)
      command(cmd).run
    end

    def within_working_dir(&block)
      create_working_dir unless cloned?
      cd_working_dir(&block)
    end

    private

    def create_working_dir
      LoggedMkdir.new(@path).mkdir
    end

    def cd_working_dir(&block)
      LoggedChdir.new(@path).chdir(&block)
    end

    def command(cmd)
      LoggedCommand.new("git", cmd)
    end
  end
end
