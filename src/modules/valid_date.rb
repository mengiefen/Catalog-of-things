def validate_date(date)
  date.match?(/^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/i)
end

def get_date(message)
  puts message
  date = gets.chomp
  valid = false
  while valid == false
    valid = validate_date(date)
    next unless valid == false

    puts 'Invalid date'
    puts message
    date = gets.chomp
  end
  date
end
