class Room

    attr_reader :name, :capacity, :songs, :guests, :song_queue, :bar_tab

    def initialize(name, capacity, guests = [], songs, song_queue = [])
        @name = name
        @capacity = capacity
        @guests = guests
        @songs = songs
        @song_queue = song_queue
        @bar_tab = 0
    end

    def number_of_guests_in_room()
        return @guests.size()
    end

    def check_in_guest(guest)
        @guests.push(guest)
    end

    def check_out_guest(guest)
        @guests.delete(guest)
    end

    def clear_room()
        @guests.clear()
    end

    def add_song_to_queue(song)
        @song_queue.push(song)
    end

    def 

    # def find_song_name(song)
    #     found_song = @songs.find { |song| song.name == song }
    #     return song
    # end



end