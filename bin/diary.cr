require "../src/diary"

manager = Diary::Manager.new

case ARGV[0]?
when nil
  puts <<-TEXT
   - new
   - list
   - finish
  TEXT
when "new"
  manager.create_entry
when "list"
  manager.list_entries
when "finish"
  manager.publish_entry
else
  raise ArgumentError.new("Unknown command #{ARGV[0]}")
end
