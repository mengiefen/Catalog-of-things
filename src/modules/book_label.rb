module BookLabel
  def create_book
    puts 'Adding Book '
    print 'Who is the Publisher? : '
    publisher = gets.chomp
    print 'Specify Book Cover State: '
    cover_state = gets.chomp

    puts 'Choose book lebel: '
    if @labels.empty?
      add_label
      label_index = 0
    else
      list_all_labels
      label_index = gets.chomp.to_i
    end

    book = Book.new(publisher, cover_state, rand(1..1000))
    book.label = (@labels[label_index])

    @books << book
    puts 'Book Created Successfully ✅'
    sleep(2)
  end

  def list_books
    if @books.empty?
      puts 'No Books to Show 🚫 '
    else
      @books.each_with_index do |book, index|
        puts "Book-[#{index}]: Publisher: #{book.publisher},  Cover State: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No labels available'

    else
      @labels.each_with_index do |label, index|
        puts "[#{index + 1}]: #{label.title}"
      end
    end
  end

  def create_label
    puts '--- No Labels in the List, Adding New Label ---'
    print ' Please enter the Title: '
    title = gets.chomp
    print 'Enter the Color: '
    color = gets.chomp
    @labels << Label.new(title, color, rand(1..1000))
    puts 'Book Created Successfully ✅'
    sleep(2)
  end
end
