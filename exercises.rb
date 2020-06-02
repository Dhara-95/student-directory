#define the methods to print them
def input_students
  puts "Please enter the names of the students, their cohort and age"
  puts "To finish, just hit return four times"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  cohort = gets.chomp
  age = gets.chomp
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
    name = gets.chomp
    cohort = gets.chomp
    age = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------".center(30)
end

def print(students)
  students_by_cohort = {}
  students.each do |student|
    name = student[:name]
    cohort = student[:cohort]
    students_by_cohort[cohort] ||= []
    students_by_cohort[cohort].push(name)
  end
  students_by_cohort.each do |cohort, name|
    puts "Students for #{cohort}: #{name.join(", ")}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
