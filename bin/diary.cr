require "../src/diary"

diary = Diary::Manager.new

exit unless ARGV.size > 0

case ARGV[0]?
when nil
  puts <<-TEXT
   - new
   - list
   - finish
  TEXT
when "new"
  diary.create_entry
when "list"
  diary.list_entries
when "finish"
  diary.publish_entry
else
  raise ArgumentError.new("Unknown command #{ARGV[0]}")
end
