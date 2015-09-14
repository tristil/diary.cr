require "../lib/ruby"
require "../lib/diary"

diary = Diary.new

puts ARGV[0].inspect

exit unless ARGV.length > 0

case ARGV[0]
when "new"
  diary.create_entry(ARGV[1])
when "finish"
  diary.publish_entry
end
