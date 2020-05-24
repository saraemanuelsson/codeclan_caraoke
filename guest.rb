class Guest

    attr_reader :name, :favourite_song, :known_songs

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
        return "Booo"
    end

    def find_and_add_known_songs_to_queue(room)

        matching_songs = room.songs & @known_songs

        matching_songs.each { |song| room.song_queue.push(song) }

    end
    

end