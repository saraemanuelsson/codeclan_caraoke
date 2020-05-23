class Guest

    attr_reader :name, :favourite_song, :songs

    def initialize(name, wallet, favourite_song, songs = [])
        @name = name
        @wallet = wallet
        @favourite_song = favourite_song
        @songs = songs
    end

    def money_in_wallet()
        return @wallet
    end

    def pay_bill(amount)
        return @wallet -= amount
    end

    def find_favourite_song(song, songs)
        return "Whoo" if songs.find { |song| song == song }
    end

    # def add_songs_to_queue(song_book)
    #     for song in song_book
    #         if @songs.include?(song)
    #             @room.increase_songs_in_queue(song)
    #         end
    #     end
    # end

    

end