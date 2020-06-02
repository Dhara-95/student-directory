def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []                                                      #amended
  # get the first name
  name = gets.chomp                                                  #amended
  # while the name is not empty, repeat this code
  while !name.empty? do                                              #amended
  # add the student hash to the array
    students << {name: name, cohort: :november}                      #amended
    puts "Now we have #{students.count} students"                    #amended
  # get another name from the user
    name = gets.chomp                                                #amended
  end
  # return the array of students
  students
end

def print_header                                                     #amended
  puts "The students of my cohort at Makers Academy"                 #amended
  puts "-------------"                                               #amended
end

def print(students)
  students.each do |student|                                          #amended
    puts "#{student[:name]} (#{student[:cohort]} cohort)"            #amended
  end
end

def print_footer(students)                                           #amended
  puts "Overall, we have #{students.count} great students"            #amended
end


students = input_students                                            #amended
print_header
print(students)                                                      #amended
print_footer(students)                                               #amended
