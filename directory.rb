# lets put all the students in an array
=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end
@students = [] # An empty array accessible to all methods

def input_students
  puts "Please enter the name of students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = "november"
  puts "#{name} added succesfully. Please add another name or hit return again to exit"
  print_no_of_students(name, cohort)
end

def print_no_of_students (name, cohort)
  while !name.empty? do
    students_to_hash(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_student_list()
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer()
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Saved student info successfully"
end

def load_students(filename = "students.csv")
  puts "Please enter filename in format 'example.csv'"
  input = STDIN.gets.chomp
  file = File.open(input, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
      #@students << {name: name, cohort: cohort.to_sym}
      students_to_hash(name, cohort)
    end
    file.close
    puts "Loaded student info successfully"
end

def try_load_students
  ARGV << 'students.csv' if ARGV.empty?
  filename = ARGV.first # first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def students_to_hash (name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
# Nothing happens until we call the methods, feeding
# in the required parameters to the arguments

try_load_students
interactive_menu
