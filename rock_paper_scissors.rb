VALID_CHOICES = %w[Rock Paper Scissors]
computer_score = 0
player_score = 0

def prompt(message)
  puts "==>> #{message}"
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.capitalize!

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('You must input a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, the computer chose #{computer_choice}.")

  if (computer_choice == 'Rock' && choice == 'Scissors') ||
     (computer_choice == 'Scissors' && choice == 'Paper') ||
     (computer_choice == 'Paper' && choice == 'Rock')
    prompt('Sorry, you lost.')
    computer_score += 1
  elsif computer_choice == choice
    prompt("It's a tie!")
  else
    prompt('You won!')
    player_score += 1
  end

  prompt("Current score: Computer- #{computer_score}, Player- #{player_score}")

  prompt('Would you like to play again? Y or N')
  play_again = gets.chomp.upcase
  break unless play_again.start_with?('Y')
end

if player_score > computer_score
  prompt("Great job! You beat the computer by a score of #{player_score} to #{computer_score}!")
elsif computer_score > player_score
  prompt("Better luck next time! The computer beat you by a score of #{computer_score} to #{player_score}.")
else
  prompt("The game was a tie at #{player_score} points each.")
end

prompt('Thanks for playing!')
