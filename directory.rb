# lets put all the students in an array
def input_students
  puts "Please enter the name of students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to array
    students << {name: name, cohort: :november, hobby: :tennis, height: :fivefeet}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(students)
  count = 0
  while count < students.length
    puts "#{students[count].key(count).to_i + 1}. #{students[count][:name]} - Hobby: #{students[count][:hobby]} - Height: #{students[count][:height]} (#{students[count][:cohort]} cohort)"
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Nothing happens until we call the methods, feeding
# in the required parameters to the arguments

students = input_students
print_header
print(students)
print_footer(students)
