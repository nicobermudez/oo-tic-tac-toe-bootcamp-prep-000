class TicTacToe

  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts '-----------'
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts '-----------'
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - log10
end

def move(index, token)
  @board[index] = token
end

def position_taken?(index)
  (@board[index] == "X" || @board[index] == "O")
end

def valid_move(index)
  !position_taken?(index) && index.between?(0, 9)
end

def turn
  puts "Please enter 1-9: "
  input = gets.strip
  index = input_to_index(input)
  char = current_player
  valid_move?(index) ? move(index, char) display_board : turn
end  

def turn_count
  n = 0 
  @board.each do |index|
    if index == "X" || index=="O"
      n+= 1
    end
  end
  return n
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
      board[win_combo[1]] == board[win_combo[2]] &&
      position_taken?(win_combo[0])
  end
end

def full?
  @board.any{|index| index == " " || index == nil}
end

def draw?
  (!won? && full?)
end

def over? 
  (won? || draw)
end

def winner
  if won?
    @board[won?[0]]
  end
end

def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

  

