require 'csv'

class Todo

  def initialize(file_name)
    @file_name = file_name
    @todos = CSV.read(@file_name, headers: true)
  end

  def start
    loop do
      system('clear')

      puts "---- TODO.rb ----"

      view_todos

      puts
      puts "What would you like to do?"
      puts "1) Exit 2) Add Todo 3) Mark Todo As Complete"
      print " > "
      action = gets.chomp.to_i
      case action
      when 1 then exit
      when 2 then add_todo
      when 3 then mark_todo
      else
        puts "\a"
        puts "Not a valid choice"
      end
    end
  end

  def add_todo
    puts "Name of Todo > "
    additional_todo = get_input
    @todos << [additional_todo, "no"]
    save!
  end


  def view_todos
    puts "Unfinished"
    first_row = @todos.first
    puts "1) #{first_row["name"]}"
    puts "Completed"
  end

  def todos
    @todos
  end

def mark_todo
   print "Which todo have you finished?"
   finished_todo = get_input
    @todos[0]["completed"] = "yes"
 end

  private
  def get_input
    gets.chomp
  end

  def save!
    File.write(@file_name, @todos.to_csv)
  end
end
