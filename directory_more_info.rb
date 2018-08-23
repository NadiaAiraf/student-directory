def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "now enter their hobby"
  hobby = gets.chomp
  puts "now enter their country of birth"
  country = gets.chomp
  while true do
    students << {name: name.capitalize, cohort: "november",hobby: hobby, country: country}
    puts "#{name.capitalize} has been entered, we now have #{students.count} students"
    name = gets.chomp
    if name.empty?
      break
    puts "now enter their hobby"
    hobby = gets.chomp
    puts "now enter their country of birth"
    country = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(names)
  names.each_with_index do |student,index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)."
    puts "Their hobby is #{student[:hobby]} and they're from #{student[:country]}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


students = input_students

print_header
print(students)
print_footer(students)


