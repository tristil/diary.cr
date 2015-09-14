require "../src/diary"

diary = Diary::Diary.new

exit unless ARGV.length > 0

case ARGV[0]
when "new"
  diary.create_entry
when "finish"
  diary.publish_entry
end
