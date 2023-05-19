require_relative 'app'

def main
  books = []
  people = []
  rentals = []

  loop do
    display_menu

    option = gets.chomp.to_i
    puts ''

    handle_option(option, books, people, rentals)

    break if option == 7
  end
end

def display_menu
  puts 'Library Management System'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
  print 'Select an option: '
end

def handle_option(option, books, people, rentals)
  option_actions = {
    1 => -> { list_all_books(books) },
    2 => -> { list_all_people(people) },
    3 => -> { create_person(people) },
    4 => -> { create_book(books) },
    5 => -> { create_rental(people, books, rentals) },
    6 => -> { list_rentals(rentals) },
    7 => -> { quit }
  }

  action = option_actions[option]
  if action
    action.call
  else
    puts 'Invalid option!'
  end
end

main
