module Monolith
  class LoggedCommand < Cocaine::CommandLine
    include Logger

    private

    def log(message)
      message.sub!("Command :: ", "")
      super
    end
  end
end
