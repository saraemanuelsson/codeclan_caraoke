require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')
require_relative('../song')
require_relative('../room')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestGuest < MiniTest::Test 

    def setup()

        @guest = Guest.new("Sara", 140, "ABC")
        
        @song1 = Song.new("Don't stop believin'", "Journey", 472)
        @song2 = Song.new("What does the fox say", "Ylvis", 28)
        @song3 = Song.new("ABC", "Jackson 5", 91)

        @songs = [@song1, @song2, @song3]

        @room = Room.new("The Disco Room", 5, @songs, 30)
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

end