module Monolith
  class LoggedChdir
    include Logger

    def initialize(dir)
      @dir = dir
    end

    def chdir(&block)
      return_value = nil

      Dir.chdir(@dir) do
        log("cd #{@dir}")
        return_value = yield
        log("cd -")
      end

      return_value
    end
  end
end
