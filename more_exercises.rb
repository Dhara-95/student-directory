@students = [] #an empty array that is accessible to all methods

#define the methods to print them
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Print source code"
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
    save_students(STDIN.gets.chomp)
    puts "Students have been saved successfully"
  when "4"
    puts "Please enter a file to load: "
    load_students(STDIN.gets.chomp)
    puts "Students have been loaded successfully"
  when "5"
    puts "Source code: "
    print_source_code
  when "9"
    puts "Thank you, goodbye"
    exit #this will cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def add_students(name, cohort) #add the hash to @students array
  @students << {name: name, cohort: "November"}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add student hash to the array
    name, cohort = name.split(",")
    add_students(name, cohort)
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

def save_students(filename)
  require "csv"
  #open the file for writing
  CSV.open(filename, "w") do |csv|
  #iterate over the array of students
    @students.each do |student|
      student_data = [student[:name]], [student[:cohort]]
      csv << student_data
    end
  end
end

def load_students(filename)
  require "csv"
  CSV.foreach(filename, "r") do |line|
      name, cohort = line
      add_students(name, cohort)
  end
end


def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil?
    load_students("students.csv")
  elsif File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist. Goodbye"
    exit #quit the program
  end
end

def print_source_code
  puts File.read($0)
end

#nothing happens until we call the methods
try_load_students
interactive_menu
