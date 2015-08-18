module Monolith
  module Logger
    def log(message)
      puts [log_prefix, message].join
    end

    private

    def log_prefix
      " -> ".blue
    end
  end
end
