module Monolith
  class BranchFinder
    include Finder

    def initialize(repo)
      @repo = repo
    end

    def all
      unique_branches.map do |branch|
        Branch.new(@repo, branch)
      end
    end

    private

    def unique_branches
      non_head_branches.uniq
    end

    def non_head_branches
      formatted_branches.reject do |branch|
        branch =~ /HEAD\s*->/
      end
    end

    def formatted_branches
      branches.map do |branch|
        BranchNameFormatter.new(branch).name
      end
    end

    def branches
      @repo.run("branch -a").split("\n")
    end
  end
end
