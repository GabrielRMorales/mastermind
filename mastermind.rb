class Mastermind
  attr_accessor :feedback, :counter
  attr_reader :colors, :answer
  def initialize()
    @colors=["GREEN","BLUE","RED","YELLOW"]
    @answer=[]
    @feedback=[]
    @counter=0
    4.times do
      @answer<<@colors.sample
    end
    
  end

  def game_on()    
    while @counter<12 do 
    puts "Turn #{@counter}"
    puts "Choose from #{@colors}"
    guess_arr=user_input()
    compare(guess_arr)
    puts ""
    feed_back(guess_arr)
    @counter+=1
    end
    puts "Game over"
    puts "Answer was #{@answer}"
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
  end
  #consider using numeric feedback ie "2 choices wrong, 1 right"
  def feed_back(arr)
    @feedback=[]
    i=0
    g=0
    j=0
    copy=[]
    
    4.times do 
    copy<<@answer[g]
    g+=1
    end
    puts "Answer is #{@answer}"
    puts "Copy is #{copy}"
    while i<4 do
      if copy[i]==arr[i]
        @feedback<<"Black"
        copy[i]=""
        arr[i]="#" 
      end     
      i+=1
    end

    while j<4 do
      if copy.include? (arr[j])
        copy[copy.index(arr[j])]=nil
        @feedback<<"White"                    
      end
      j+=1
    end
    puts "#{@feedback}"
  end

end

game=Mastermind.new
game.game_on()