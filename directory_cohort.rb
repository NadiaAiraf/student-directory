def input_students

  students = []
  name = new_student_name
  
  while !name.empty? do
    cohort = new_student_cohort
    puts "~~~~~~~~~~~~"
    students << {name: name.capitalize, cohort: cohort}
    puts "#{name.capitalize} has been entered, we now have #{students.count} students"
    puts ""
    name = new_student_name
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(names)
  names.each_with_index do |student,index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  a = " Overall, we have #{names.count} great students "
  puts a.center(a.size+9,"~")
end

def new_student_cohort
  months = ["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"]
  while true do
    puts "Now enter which cohort you're from, enter the first 3 letters from the month."
    puts "If you don't know your cohort, hit enter and we'll say you're january"
    cohort = gets.chomp.downcase
    if cohort.empty?
      cohort = "jan"
      break
    elsif months.include?(cohort)
      break
    else
    puts "Now enter which cohort you're from, enter the first 3 letters from the month."
    puts "If you don't know your cohort, hit enter and we'll say you're january" 
    puts "-------"
    end
  end
  cohort
end

def new_student_name
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  puts ""
  name
end


students = input_students

print_header
print(students)
print_footer(students)


