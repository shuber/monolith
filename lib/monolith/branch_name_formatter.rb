module Monolith
  class BranchNameFormatter
    def initialize(name)
      @name = name
    end

    def name
      strip_selected_branch_prefix
      strip_whitespace_prefix
      strip_remote_prefix
      @name
    end

    private

    def strip_selected_branch_prefix
      strip("*")
    end

    def strip_whitespace_prefix
      strip(/\s+/)
    end

    def strip_remote_prefix
      strip("remotes/origin/")
    end

    def strip(pattern)
      @name.sub!(pattern, "")
    end
  end
end
