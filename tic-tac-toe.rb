#create two boards, one original for resetting and one for changing during turns
#create variables for spaces on the board based on index so changes to board structure dont result in errors
board = " 1 | 2 | 3\n-----------\n 4 | 5 | 6\n-----------\n 7 | 8 | 9"
$board_played = " 1 | 2 | 3\n-----------\n 4 | 5 | 6\n-----------\n 7 | 8 | 9"
$space_1 = $board_played.index('1')
$space_2 = $board_played.index('2')
$space_3 = $board_played.index('3')
$space_4 = $board_played.index('4')
$space_5 = $board_played.index('5')
$space_6 = $board_played.index('6')
$space_7 = $board_played.index('7')
$space_8 = $board_played.index('8')
$space_9 = $board_played.index('9')

#define draw? for later use
def draw?
    if $board_played.match(/[0-9]/) == nil
        return true
    else
        return false
    end
end


#create Player class and define methods for taking a turn and checking for win
class Player
    attr_accessor :letter
    def initialize(letter)
        @letter = letter
    end
    def take_turn(space)
        $board_played = $board_played.sub(space, self.letter)
    end
    def win?
        case
        when $board_played[$space_1] == "X" && $board_played[$space_2] == "X" && $board_played[$space_3] == "X"
            true
        when $board_played[$space_4] == "X" && $board_played[$space_5] == "X" && $board_played[$space_6] == "X"
            true
        when $board_played[$space_7] == "X" && $board_played[$space_8] == "X" && $board_played[$space_9] == "X"
            true
        when $board_played[$space_1] == "X" && $board_played[$space_4] == "X" && $board_played[$space_7] == "X"
            true
        when $board_played[$space_2] == "X" && $board_played[$space_5] == "X" && $board_played[$space_8] == "X"
            true
        when $board_played[$space_3] == "X" && $board_played[$space_6] == "X" && $board_played[$space_9] == "X"
            true
        when $board_played[$space_1] == "X" && $board_played[$space_5] == "X" && $board_played[$space_9] == "X"
            true
        when $board_played[$space_7] == "X" && $board_played[$space_5] == "X" && $board_played[$space_3] == "X"
            true
        when $board_played[$space_1] == "O" && $board_played[$space_2] == "O" && $board_played[$space_3] == "O"
            true
        when $board_played[$space_4] == "O" && $board_played[$space_5] == "O" && $board_played[$space_6] == "O"
            true
        when $board_played[$space_7] == "O" && $board_played[$space_8] == "O" && $board_played[$space_9] == "O"
            true
        when $board_played[$space_1] == "O" && $board_played[$space_4] == "O" && $board_played[$space_7] == "O"
            true
        when $board_played[$space_2] == "O" && $board_played[$space_5] == "O" && $board_played[$space_8] == "O"
            true
        when $board_played[$space_3] == "O" && $board_played[$space_6] == "O" && $board_played[$space_9] == "O"
            true
        when $board_played[$space_1] == "O" && $board_played[$space_5] == "O" && $board_played[$space_9] == "O"
            true
        when $board_played[$space_7] == "O" && $board_played[$space_5] == "O" && $board_played[$space_3] == "O"
            true
        else
            false
        end
    end      
end
#define each player with their letters
player1 = Player.new("X")
player2 = Player.new("O")
#infinite loop that breaks when someone wins
while true do
    puts "\n" + $board_played
    puts "Pick a space"
    player1_choice = gets.chomp
    while player1_choice !~ /[1-9]/
        puts "Please enter a number from 1 to 9"
        player1_choice = gets.chomp
    end
    player1.take_turn(player1_choice)
    if player1.win?
        puts $board_played
        puts "Player 1 wins!"
        break
    end
    if draw?
        $board_played = board
        puts "It's a draw. Try again!"
        next
    end
    puts "\n" + $board_played
    puts "Pick a space"
    
    player2_choice = gets.chomp
    while player2_choice !~ /[1-9]/
        puts "Please enter a number from 1 to 9"
        player2_choice = gets.chomp
    end
    player2.take_turn(player2_choice)
    if player2.win?
        puts $board_played
        puts "Player 2 wins!"
        break
    end
    if draw?
        $board_played = board
        puts "It's a draw. Try again!"
        next
    end  
end

