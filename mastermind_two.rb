class Mastermind
  attr_accessor :feedback, :counter
  attr_reader :colors, :answer
  def initialize()
    @colors=["GREEN","BLUE","RED","YELLOW"]
    @answer=[]
    @feedback=[]
    @counter=0     
  end

  def selector()
    puts "Choose CREATE or SOLVE"
    choice=gets.chomp
    choice.upcase!
    puts "You chose #{choice}"
    while (choice!="CREATE" && choice!="SOLVE") do
      puts "Choose CREATE or SOLVE"
      choice=gets.chomp.upcase!
    end
    if choice=="CREATE"
      puts "#{@colors}"
      4.times do
        puts "Enter the ARRAY VALUE for a color: GREEN[0], BLUE[1], RED[2], or YELLOW[3]"
        num=gets.chomp
        @answer<<@colors[num.to_i]
      end
      comp_plays()
    elsif choice=="SOLVE"
      4.times do
        @answer<<@colors.sample
      end
      user_plays()
    end
  end

  def user_plays()      
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

  def comp_plays()   
    puts "Computer chooses from #{@colors}"    
    while @counter<12 do 
    puts "Turn #{@counter}"   
    guess_arr=comp_input()
    puts "#{guess_arr}"
    compare(guess_arr)
    puts ""
    #feed_back(guess_arr)
    @counter+=1
    end
    puts "Game over"
    puts "Answer was #{@answer}"
  end

  def comp_input()
    guess=[]
    4.times do
      guess<<@colors.sample
    end
    guess
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
      puts "Victory!"
      @counter=12
    end    
  end

  def feed_back(arr)
    @feedback=[]
    i=0
    g=0
    j=0   
    copy=@answer.clone
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
game.selector()