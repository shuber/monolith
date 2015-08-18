module Monolith
  class LoggedMkdir
    include Logger

    def initialize(dir)
      @dir = dir
    end

    def mkdir
      log("mkdir -p #{@dir}")
      FileUtils.mkdir_p(@dir)
    end
  end
end
