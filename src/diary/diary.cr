module Diary
  class Diary
    def create_entry(time_format = "%Y-%m-%d-%H-%M")
      current_time = Time.now
      file_basename = "#{current_time.strftime(time_format)}.md"
      file_path = File.join(".", "diary", file_basename)
      header = <<-HEADER
### #{current_time.strftime("%A, %Y-%m-%d %H:%M %p")}
      HEADER
      File.write(file_path, header)
      `vi #{file_path}`
    end

    def publish_entry
      `git add .`
      `git commit -m 'Entry for #{Time.now.strftime("%Y/%m/%d")}'`
      `git push`
    end
  end
end
