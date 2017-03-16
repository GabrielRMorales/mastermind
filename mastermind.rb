#4 color options
class Mastermind
  def initialize
    @colors=["GREEN","BLUE","RED","YELLOW"]
    @answer=[]
    @feedback=[]
    @counter=0
    4.times do
      @answer<<@colors.sample
    end
    puts @answer
  end

  def game_on()    
    while @counter<12 do 
    puts "Turn #{@counter}"
    puts "Choose from #{@colors}"
    guess_arr=user_input()
    compare(guess_arr)
    puts feed_back(guess_arr)
    @counter+=1
    end
    puts "Game over"
  end

  def user_input()
    guess=[]
    4.times do
      "Give a color:"
      user_guess=gets.chomp
      guess<<user_guess.upcase
    end
    guess
  end

  def compare(arr)
    if @answer==arr
      puts "Player wins!"
      @counter=12
    end
    #add restart ability
    
  end

  def feed_back(arr)
    @feedback=[]
    i=0
    while i<4 do
      if arr.include? (@answer[i])
        if @answer[i]==arr[i]
          @feedback<<"Black"
        elsif @answer[i]!=arr[i]
          @feedback<<"White"
        end
      arr[i]=""
      end
      
      i+=1
    end
    @feedback
  end

end

game=Mastermind.new
game.game_on()