require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

def list_all_books(books)
  puts 'List of books:'
  puts
  books.each_with_index do |book, index|
    puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
    puts
  end
end

def list_all_people(people)
  puts 'List of people:'
  puts
  people.each_with_index do |person, index|
    puts "#{index + 1}. Name: #{person.name}, ID: #{person.id}"
    puts
  end
end

def create_person(people)
  puts 'Select person type:'
  puts '1. Student'
  puts '2. Teacher'
  print 'Choice: '
  type = gets.chomp.to_i

  case type
  when 1
    create_student(people)
  when 2
    create_teacher(people)
  else
    puts 'Invalid option!'
  end
end

def create_student(people)
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? (Y/N): '
  permission = gets.chomp == 'Y'
  student_classroom = Classroom.new('Classroom 1')
  person = Student.new(student_classroom, age, name: name, parent_permission: permission)
  people.push(person)
  puts 'Person created successfully!'
  puts
end

def create_teacher(people)
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  person = Teacher.new(age, '', name: name)
  people.push(person)
  puts 'Person created successfully!'
  puts
end

def create_book(books)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  books.push(Book.new(title, author))
  puts 'Book created successfully!'
  puts
end

def create_rental(people, books, rentals)
  selected_book = select_book(books)
  selected_person = select_person(people)
  return unless selected_book && selected_person

  print 'Date: '
  date = gets.chomp
  create_rental_entry(date, selected_book, selected_person, rentals)
end

def select_book(books)
  puts 'Select a book from the following list by number'
  list_all_books(books)
  print 'Book number: '
  book_index = gets.chomp.to_i
  selected_book = books[book_index - 1]

  if selected_book.nil?
    puts 'Invalid book number!'
    return nil
  end

  selected_book
end

def select_person(people)
  puts 'Select a person from the following list by number (not ID) or create a new person'
  list_all_people(people)
  print 'Person number: '
  person_index = gets.chomp.to_i
  selected_person = people[person_index - 1]

  if selected_person.nil?
    puts 'Invalid person number!'
    return nil
  end

  selected_person
end

def create_rental_entry(date, selected_book, selected_person, rentals)
  rentals.push(Rental.new(date, selected_book, selected_person))
  puts 'Rental created successfully!'
  puts
end

def list_rentals(rentals)
  puts 'List of rentals:'
  puts
  rentals.each_with_index do |rental, index|
    print_rental_info(rental, index)
  end
end

def print_rental_info(rental, index)
  book_info = "Book: #{rental.book.title} by #{rental.book.author}"
  person_info = "Person: #{rental.person.name}"
  date_info = "Date: #{rental.date}"
  puts "#{index + 1}. #{book_info} - #{person_info} - #{date_info}"
  puts
end

def quit
  puts 'Goodbye!'
end
