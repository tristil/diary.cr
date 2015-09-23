require "./entry"

module Diary
  class Manager
    attr_reader :entries_dir

    @entries_dir = File.join(".", "diary")
  end
end
