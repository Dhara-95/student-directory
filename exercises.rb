#define the methods to print them
def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return until you see the list of names."
  #create an empty array
  students = []
  #get the first name
  puts "Enter name: "
  name = gets.strip
  puts "Enter cohort: "
  cohort = gets.strip
  puts "Enter age: "
  age = gets.strip
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add student hash to the array
    if cohort == ""
      cohort << ("June")
    end
    students << {name: name, cohort: cohort.to_sym, age: age}
    if students.count <= 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    #get another name and cohort from the user
    puts "Enter name: "
    name = gets.strip
    puts "Enter cohort: "
    cohort = gets.strip
    puts "Enter age: "
    age = gets.strip
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------".center(30)
end

def print(students)
  if !students.empty?
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort, #{student[:age]}yrs)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
