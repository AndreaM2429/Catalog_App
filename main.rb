require_relative 'app'

class Main
  def initialize
    @app = App.new
    @menu = {
      '1' => 'list_all_books', '2' => 'list_all_albums',
      '3' => 'list_all_games', '4' => 'list_all_genre',
      '5' => 'list_all_labels', '6' => 'list_all_authors',
      '7' => 'add_a_book', '8' => 'add_a_music_album',
      '9' => 'add_a_game', '10' => 'end_app'
    }.freeze
  end

  def menu
    puts "\nPlease choose an option by enter a number"
    @menu.each { |key, element| puts "#{key} - #{element.capitalize.gsub '_', ' '}" }
    print "\nYour option: "
    action = @menu[gets.chomp]
    if action
      action
    else
      puts "\n(͠°◡͡°) Invalid option select a valid one\n\n"
      menu
    end
  end

  def start
    puts "Welcome to the Catalog of my Things App ◦°˚ヽ(•◡•)ノ˚°◦\n\n"
    loop do
      @app.send(menu)
    end
  end
end

Main.new.start
