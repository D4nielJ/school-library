class UserInterface
  UI_MAP = {
    1 => list_all_books,
    2 => list_all_people,
    3 => create_a_person,
    4 => create_a_book,
    5 => create_a_rental,
    6 => list_all_rentals,
    7 => exit_app,
    8 => no_valid_method
  }.freeze

  def ui_map(number)
    UI_MAP(number)
  end

  def list_all_books
    "I'm working"
  end

  def list_all_people
    "I'm working"
  end

  def create_a_person
    "I'm working"
  end

  def create_a_book
    "I'm working"
  end

  def create_a_rental
    "I'm working"
  end

  def list_all_rentals
    "I'm working"
  end

  def exit_app
    "I'm working"
  end

  def no_valid_method
    "I'm working"
  end
end
