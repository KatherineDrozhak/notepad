require_relative '../notepad/post'
require_relative '../notepad/link'
require_relative '../notepad/task'
require_relative '../notepad/memo'

puts "Привет, я твой блокнот! Версия 2 + Sqlite"
puts "Что хотите записать в блокнот?"

choices = Post.post_types.keys

choice = -1

until choice >= 0 && choice < choices.size

  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = STDIN.gets.chomp.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console
id = entry.save_to_db

puts "Ура, запись сохранена, id = #{id}"