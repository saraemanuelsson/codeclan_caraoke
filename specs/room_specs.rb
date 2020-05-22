require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')
require_relative('../song')
require_relative('../guest')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRoom < MiniTest::Test 

    def setup



        @guest1 = Guest.new("Bill", 3, "What does the fox say")
        @guest2 = Guest.new("Anna", 573, "I wanna dance with somebody")
        @guest3 = Guest.new("Linda", 47, "Whistle")

        @guests = [@guest1, @guest2, @guest3]
        
        @song1 = Song.new("Don't stop believin'", "Journey")
        @song2 = Song.new("Livin' on a prayer", "Bon Jovi")
        @song3 = Song.new("Thrift shop", "Macklemore")

        @songs = [@song1, @song2, @song3]

        @room = Room.new("Burn Baby Burn", 10, @guests, @songs)

    end

    def test_name()
        assert_equal("Burn Baby Burn", @room.name)
    end

    def test_capacity()
        assert_equal(10, @room.capacity)
    end

    def test_check_in_guest()
        @room.check_in_guest(@guest1)
        @room.check_in_guest(@guest2)
        @room.check_in_guest(@guest3)
        assert_equal(6, @room.number_of_guests_in_room())
    end

    def test_check_out_guest()
        @room.check_out_guest(@guest2)
        assert_equal(2, @room.number_of_guests_in_room())
    end

    def test_clear_room()
        @room.clear_room()
        assert_equal(0, @room.number_of_guests_in_room())
    end
    
    # def test_add_songs_to_queue()
    # end

    # def test_empty_queue_when_guests_leave()
    # end
    
    # def test_play_song()
    # end

    # def test_sell_drink()
    # end

    # def test_increase_bar_tab()
    # end

end
