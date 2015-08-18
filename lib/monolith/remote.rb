module Monolith
  class Remote
    extend Forwardable

    def_delegator :@repo, :run
    def_delegators :@remote, :name, :relative_path

    def initialize(repo, remote)
      @repo = repo
      @remote = remote
    end

    def add
      run("remote add #{name} #{relative_path}")
    end

    def remove
      run("remote remove #{name}")
    end
  end
end
