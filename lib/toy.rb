# frozen_string_literal: true

require "toy/version"
require "toy/parser"
require "toy/command"

Dir[File.join(__dir__, "toy", "commands", "*.rb")].each { |f| require f }

module Toy
  class Error < StandardError; end
  class NotImplemented < StandardError; end
  # Your code goes here...
end
