class Guest

    attr_reader :name, :favourite_song

    def initialize(name, wallet, favourite_song)
        @name = name
        @wallet = wallet
        @favourite_song = favourite_song
        @songs = []
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

end