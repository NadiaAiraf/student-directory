def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name.capitalize, cohort: "november"}
    puts "#{name.capitalize} has been entered, we now have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(names)
  puts "If you would only like students whose name begins with certain letters, enter them now"
  puts "For all students, just hit return"
  first_letter = gets.chomp.upcase.chars
  if first_letter.empty?
    names.each_with_index do |student,index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end    
  end
  
  names.each_with_index do |student,index|
    if first_letter.include? student[:name][0]
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


students = input_students

print_header
print(students)
print_footer(students)


