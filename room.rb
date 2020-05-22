class Room

    attr_reader :name, :capacity, :songs, :guests, :song_queue, :bar_tab

    def initialize(name, capacity, guests = [], songs)
        @name = name
        @capacity = capacity
        @songs = songs
        @guests = guests
        @song_queue = []
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



end