require 'thor'
module Wizer
  class CLI < Thor
    desc "hello world", "my first cli"
    def self.hello
      "Hello world"
    end
  end
end
