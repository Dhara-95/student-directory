@students = [] #an empty array that is accessible to all methods

#define the methods to print them
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    #print the menu and ask the user what to do
    print_menu
    #read the input, save it into a variable, and do what the user has asked
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "Your input was successful"
  when "2"
    show_students
  when "3"
    puts "Please enter file to save to: "
    save_students
    puts "Students have been saved successfully"
  when "4"
    puts "Please enter which file to load: "
    load_students
    puts "Students have been loaded successfully"
  when "9"
    puts "Thank you, goodbye"
    exit #this will cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def students_array(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add student hash to the array
    students_array(name)
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  user_input = STDIN.gets.chomp
  #open the file for writing
  file = File.open("#{user_input}", "w") do |file|
  #iterate over teh array of students
  @students.each do |student|
    student_data = [student[:name]], [student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
end
end

def load_students(filename = "students.csv")
  user_input = STDIN.gets.chomp
  file = File.open(filename, "r") do |file|
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    students_array(name, cohort)
  end
end
end

def try_load_students
  #ask user for filename to load
  puts "Please enter file to load"
  filename = ARGV.first #first argument from the command line
  if filename.nil? #get out of the method if it isn't given
    filename = "students.csv"
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exists
    puts "Sorry, #{filename} doesn't exist. Goodbye"
    exit #quit the program
  end
end
end

#nothing happens until we call the methods
try_load_students
interactive_menu