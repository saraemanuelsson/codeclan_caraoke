class Room

    attr_reader :name, :capacity, :songs, :price_per_hour, :timer, :guests, :song_queue, :bar_tab

    def initialize(name, capacity, songs, price_per_hour)
        @name = name
        @capacity = capacity
        @songs = songs
        @price_per_hour = price_per_hour
        @timer = 0
        @guests = []
        @song_queue = []
        @bar_tab = 0
    end

    def number_of_guests_in_room()
        return @guests.size()
    end

    def check_in_guest(guest)
        @guests.push(guest) if @guests.size < @capacity
    end

    def check_out_guest(guest)
        @guests.delete(guest)
    end

    def clear_room()
        @guests.clear()
        @song_queue.clear()
    end

    def increase_songs_in_queue(song)
        @song_queue.push(song)
    end

    def remove_song_from_queue(song)
        @song_queue.delete(song)
    end

    def play_song()
        return @song_queue.shift()
    end

    def increase_timer(minutes)
        @timer += minutes
    end

    def increase_bar_tab(price)
        @bar_tab += price
    end

    def charge_per_booking()
        used_hours = @timer / 60.0
        return used_hours.ceil * price_per_hour
    end

    def find_song_by_name(song_name)
        songs.find { |song| song.name == song_name }
    end

    def find_songs_by_artist(artist)
        found_songs = songs.find_all { |song| song.artist == artist }
        return found_songs
    end

end