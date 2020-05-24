class Guest

    attr_reader :name, :favourite_song, :songs

    def initialize(name, wallet, favourite_song, known_songs = [])
        @name = name
        @wallet = wallet
        @favourite_song = favourite_song
        @known_songs = known_songs
    end

    def money_in_wallet()
        return @wallet
    end

    def pay_bill(amount)
        return @wallet -= amount
    end

    def cheer_if_room_has_favourite_song(room)
        return "Whoo" if room.find_song_by_name(@favourite_song) != nil
    end

    def find_and_add_known_songs_to_queue(songs, queue)

        available_song_titles = []
        songs.each { |song| available_song_titles.push(song.name) }

        known_song_titles = []
        @known_songs.each { |song| known_song_titles.push(song.name) }

        matching_songs = available_song_titles & known_song_titles

        matching_songs.each { |song| queue.push(song) }

    end
    

end