require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')
require_relative('../song')
require_relative('../room')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestGuest < MiniTest::Test 

    def setup()

        @song1 = Song.new("Waterloo", "ABBA")
        @song2 = Song.new("What does the fox say", "Ylvis")
        @song3 = Song.new("ABC", "Jackson 5")

        @known_songs = [@song1, @song2, @song3]

        @guest = Guest.new("Sara", 140, "ABC", @known_songs)
        
        @song4 = Song.new("Don't stop believin'", "Journey")
        @song5 = Song.new("What does the fox say", "Ylvis")
        @song6 = Song.new("ABC", "Jackson 5")

        @song_book = [@song4, @song5, @song6]

        @room = Room.new("The Disco Room", 5, @song_book, 30)
    end

    def test_name()
        assert_equal("Sara", @guest.name())
    end

    def test_money_in_wallet()
        result = @guest.money_in_wallet()
        assert_equal(140, result)
    end

    def test_favourite_song()
        assert_equal("ABC", @guest.favourite_song())
    end

    def test_pay_bill()
        assert_equal(115, @guest.pay_bill(25))
    end

    def test_cheer_if_favourite_song_found()
        result = @guest.cheer_if_room_has_favourite_song(@room)
        assert_equal("Whoo", result)
    end

    def test_find_and_add_known_songs_to_queue()
        @guest.find_and_add_known_songs_to_queue(@song_book, @room.song_queue())
        assert_equal(2, @room.song_queue.size)
    end

end