def message(input)
  puts "==> #{input}"
end

loop do
  loan_amount = ''
  loop do
    message('Loan amount: ')
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_i <= 0
      message('You must enter a valid loan amount.')
    else
      break
    end
  end

  apr = ''
  loop do
    message('APR %: ')
    apr = gets.chomp
    if apr.empty? || apr.to_i.negative?
      message('You must enter a valid APR.')
    else
      break
    end
  end
  
  duration = ''
  loop do
    message('Loan duration (in months): ')
    duration = gets.chomp
    if duration.empty? || duration.to_i <= 0
      message('You must enter a valid duration.')
    else
      break
    end
  end

  monthly_rate = ((apr.to_f / 12) / 100)
  monthly_payment = loan_amount.to_f * (monthly_rate / (1 - (1 + monthly_rate)**(-duration.to_i)))

  message("Your monthly payment would be $#{format('%.2f', monthly_payment)}.")
  message("Total of all payments would be: $#{format('%.2f', monthly_payment * duration.to_i)}")
  message('Would you like to calculate another payment? Y or N')
  answer = gets.chomp.upcase

  break unless answer.start_with?('Y')
end

message('Thanks for using our calculator! Have a great day!')
