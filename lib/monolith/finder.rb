module Monolith
  module Finder
    def self.included(mod)
      mod.class_eval do
        extend Forwardable
        include Enumerable

        def_delegators :all, :each, :size
      end
    end

    def find_by_name(name)
      detect do |findable|
        findable.name == name
      end
    end
  end
end
