require 'pry'

#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

my_songs = {
"Go Go GO" => 'C:/Users/Andrew/.atom/.learn-ide/home/aaj3f/jukebox-cli-online-web-prework/audio/Emerald-Park/01.mp3',
"LiberTeens" => 'C:/Users/Andrew/.atom/.learn-ide/home/aaj3f/jukebox-cli-online-web-prework/audio/Emerald-Park/02.mp3',
"Hamburg" =>  'C:/Users/Andrew/.atom/.learn-ide/home/aaj3f/jukebox-cli-online-web-prework/audio/Emerald-Park/03.mp3',
"Guiding Light" => 'C:/Users/Andrew/.atom/.learn-ide/home/aaj3f/jukebox-cli-online-web-prework/audio/Emerald-Park/04.mp3',
"Wolf" => 'C:/Users/Andrew/.atom/.learn-ide/home/aaj3f/jukebox-cli-online-web-prework/audio/Emerald-Park/05.mp3',
"Blue" => 'C:/Users/Andrew/.atom/.learn-ide/home/aaj3f/jukebox-cli-online-web-prework/audio/Emerald-Park/06.mp3',
"Graduation Failed" => 'C:/Users/Andrew/.atom/.learn-ide/home/aaj3f/jukebox-cli-online-web-prework/audio/Emerald-Park/07.mp3'
 }

def help
  puts "I accept the following commands:\n - help : displays this help message\n - list : displays a list of songs you can play\n - play : lets you choose a song to play\n - exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  my_songs.each do |k, v|
    puts "#{k}"
  end
end

#binding.pry

def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow users to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name:"
  #binding.pry
  response = gets.chomp
  if my_songs.keys.include?(response)
    puts "Playing #{response}"
    #binding.pry
    system "start spotify #{my_songs[response]}"
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  loop do
    puts "Please enter a command:"
    input = gets.chomp
    case input
    when "help"
      help
    when "play"
      list(my_songs)
      play(my_songs)
    when "list"
      list(my_songs)
    when "exit"
      exit_jukebox
      break
    end
  end
end
