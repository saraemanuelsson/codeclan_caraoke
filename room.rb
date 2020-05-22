class Room

    attr_reader :name, :capacity, :songs, :guests, :song_queue, :bar_tab

    def initialize(name, capacity)
        @name = name
        @capacity = capacity
        @songs = songs
        @guests = []
        @song_queue = []
        @bar_tab = 0
    end

end