require "./entry"

module Diary
  class Manager
    def entries_directory
      @entries_directory ||= File.expand_path(File.join(ENV["HOME"], ".diary"))
    end

    def create_entry(time_format = "%Y-%m-%d-%H-%M")
      Dir.mkdir_p(entries_directory)
      current_time = Time.now
      file_basename = "#{current_time.to_s(time_format)}.md"
      file_path = File.join(entries_directory, file_basename)
      header = <<-HEADER
      ### #{current_time.to_s("%A, %Y-%m-%d %H:%M %p")}
      HEADER
      puts file_path
      File.write(file_path, header)
      system("nvim #{file_path}")
    end

    def publish_entry
      system(<<-SHELL
        cd #{entries_directory}
        git add .
        git commit -m 'Entry for #{Time.now.to_s("%Y/%m/%d")}'
        git push
      SHELL
      )
    end

    def entries
      @entries ||= Dir["#{entries_directory}/*"].map { |file| Entry.new(file) }
    end

    def list_entries
      string = entries.reverse.map(&.name).join("\n")
      picked = `echo \"#{string}\" | pick`.strip
      open_picked_entry(picked)
    end

    def open_picked_entry(name)
      entry = entries.find { |entry| entry.name == name }
      raise "Something went wrong" unless entry
      system("nvim #{entry.file}")
    end
  end
end
