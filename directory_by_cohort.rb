def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  name = new_student_name
  while !name.empty? do
    cohort = new_student_cohort
    @students << {name: name.capitalize, cohort: cohort}
    puts "#{name.capitalize} has been entered, we now have #{@students.count} student#{@students.count == 1 ? "" : "s"}"
    puts "~~~~~~~~~~~~~~"
    name = new_student_name
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_footer
  a = " Overall, we have #{@students.count} great student#{@students.count == 1? "" : "s"}"
  puts a.center(a.size+9,"~")
end

def print_student_list
  cohorts = @students.map{|x| x[:cohort]}.uniq
  cohorts.each do |y|
    puts y.capitalize + ' cohort:'
    puts "-----"
    @students.each{|z| puts z[:name] if z[:cohort] == y}
    puts ""
  end
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
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp
  name
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    print_header
    print_student_list
    print_footer
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end
interactive_menu
