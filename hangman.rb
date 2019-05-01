
def choose_word(array)
  word = array[rand(array.length)]
end

def check_win(word)
  star = 0

  word.each do |i|
    if i == '_'
      star += 1
    end
  end
  if star == 0
    return 1
  else
    return 0
  end
end

def fill_blind_word(word)
  blind_word = []
  for i in 0...word.length
    if word[i] == ' '
      blind_word[i] = ' '
    elsif word[i] == "\n"
      i += 1
    else
      blind_word[i] = '_'
    end
  end
  return blind_word
end

def game(word)
  life = 10
  check = 0
  blind_word = fill_blind_word(word)

  while life > 0
    blind_word.each { |i| print "#{i}" }
    puts "\t il vous reste: #{life} points de vie"
    letter = gets
    for i in 0...word.length
      if letter[0] == word[i]
        blind_word[i] = letter[0]
        check += 1
      end
    end
    if check == 0
      life -= 1
    end
    if check_win(blind_word) == 1
      blind_word.each { |i| print "#{i}" }
      puts "\n\nVous avez gagné !!!\n"
      return 0
    end
    check = 0
  end
  puts "\nDommage le mot etait:\n\t#{word}"
end

def main
  array = ARGF.readlines
  word = choose_word(array)
  word.downcase!
  game(word)
end

main