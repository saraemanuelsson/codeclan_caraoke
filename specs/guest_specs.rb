require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')
require_relative('../song')
require_relative('../room')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestGuest < MiniTest::Test 

    def setup()

        @song1 = Song.new("Waterloo", "ABBA", 1)
        @song2 = Song.new("What does the fox say", "Ylvis", 28)
        @song3 = Song.new("ABC", "Jackson 5", 91)

        @wants_to_sing = [@song1, @song2, @song3]

        @guest = Guest.new("Sara", 140, "ABC", @wants_to_sing)
        
        @song4 = Song.new("Don't stop believin'", "Journey", 472)
        @song5 = Song.new("What does the fox say", "Ylvis", 28)
        @song6 = Song.new("ABC", "Jackson 5", 91)

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

    def test_find_favourite_song()
        result = @guest.find_favourite_song("ABC", @room.songs)
        assert_equal("Whoo", result)
    end

    # def test_add_songs_to_queue()
    #     @guest.add_songs_to_queue(@songs)
    #     assert_equal(2, @room.song_queue.size)
    # end

    # def test_pay_money()
    #     assert_equal()
    # end



end