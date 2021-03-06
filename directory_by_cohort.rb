def interactive_menu
  @students = []
  load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
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
    cohort = STDIN.gets.chomp.downcase
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
  name = STDIN.gets.chomp
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
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list of students to students.csv"
  puts "4. Load list of students from students.csv"
  puts "9. Exit"
end

def save_students
  puts "what filename would you like the list of students to be called?"
  filename = STDIN.gets.chomp
  File::open(filename,"w") do |file|
    @students.each do |student|
      student_data = [student[:name],student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    puts "Saved the current list of students to students.csv"
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort}
    puts "Loaded data from #{filename}"
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

interactive_menu
