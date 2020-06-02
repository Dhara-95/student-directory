#define the methods to print them
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add student hash to the array
    students << {name: name, cohort: :november, age: :"25",
      hobby: :"fighting crime"}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  while students.length < 12 do
    students.each_with_index do |student, index|
      if student[:name].chr == "D" && student[:name].length < 12
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort),
        #{student[:age]} yrs old, hobbies include #{student[:hobby]}"
      end
    end
    break
  end
  students
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
