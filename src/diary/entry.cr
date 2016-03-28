module Diary
  class Entry
    FILE_REGEXP = /(\d{4}-\d{2}-\d{2})-(\d{1,2}-\d{2})/

    getter :file

    def initialize(@file)
    end

    def basename
      @basename ||= File.basename(@file, ".md")
    end

    def date
      md = FILE_REGEXP.match(basename) || raise "Malformed file #{basename}"
      md[1]
    end

    def hour
      md = FILE_REGEXP.match(basename) || raise "Malformed file #{basename}"
      md[2].gsub("-", ":")
    end

    def name
      "#{date} #{hour}"
    end
  end
end
