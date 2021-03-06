require "fileutils"
require "forwardable"
require "yaml"

require "bundler/setup"
require "cocaine"
require "colorize"
require "formatador"
require "thor"

require_relative "monolith/finder"
require_relative "monolith/logger"

require_relative "monolith/branch"
require_relative "monolith/branch_finder"
require_relative "monolith/branch_merger"
require_relative "monolith/branch_name_formatter"
require_relative "monolith/branch_preparer"
require_relative "monolith/cli"
require_relative "monolith/configuration"
require_relative "monolith/configuration_printer"
require_relative "monolith/generator"
require_relative "monolith/git"
require_relative "monolith/logged_chdir"
require_relative "monolith/logged_command"
require_relative "monolith/logged_mkdir"
require_relative "monolith/repository"
require_relative "monolith/remote"
require_relative "monolith/repository_creator"
require_relative "monolith/repository_finder"

require_relative "monolith/application"
