require "./entry"

module Diary
  class Manager
    getter :entries_dir

    @entries_dir = File.join(".", "diary")

    def entries_directory
      File.expand_path(File.join(".", "diary"))
    end

    def create_entry(time_format = "%Y-%m-%d-%H-%M")
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
      `git add .`
      `git commit -m 'Entry for #{Time.now.to_s("%Y/%m/%d")}'`
      `git push`
    end

    def list_entries
      Dir["*"]
    end
  end
end
