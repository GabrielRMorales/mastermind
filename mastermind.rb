class Mastermind
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
      @guess=[" "," "," "," "]
      puts "#{@colors}"
      4.times do
        puts "Enter the ARRAY VALUE for a color: GREEN[0], BLUE[1], RED[2], or YELLOW[3]"
        num=gets.chomp
        @answer<<@colors[num.to_i]
      end
      puts "#{@answer}"
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
    feedback(guess_arr)
    @counter+=1
    end
    puts "Game over"
    puts "Answer was #{@answer}"
  end

  def comp_plays()   
    puts "Computer chooses from #{@colors}"    
    while @counter<12 do 
    puts "Turn #{@counter}"   
    comp_input()
    puts "Comp's guess: #{@guess}"
    compare(@guess)  
    @counter+=1
    puts ""
    end
    puts "Game over"
    puts "Answer was #{@answer}"
  end

  def comp_input()
    j=0
    i=0
    newguess=[]
    while j<4 && @counter>0 do
      if @answer[i]!=@guess[i]
        if @answer.include? (@guess[i])
          newguess<<@guess[i]
        end
      end
      j+=1
    end
      
    while i<4 do
      if @answer[i]!=@guess[i]
        @guess[i]=@colors.sample
      end
      i+=1
      if i==4
        newguess.each do |x|
        puts "Must include #{x}"
        if @guess.include?(x)==false
          i=0
        end
        end
      end
    end

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

  def feedback(arr)
    @feedback=[]
    i=0
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
    puts "Feedback: #{@feedback}"
  end

end

game=Mastermind.new
game.selector()