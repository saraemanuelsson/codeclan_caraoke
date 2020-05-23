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
        
        @song1 = Song.new("Don't stop believin'", "Journey", 472)
        @song2 = Song.new("What does the fox say", "Ylvis", 28)
        @song3 = Song.new("Thrift shop", "Macklemore", 91)

        @songs = [@song1, @song2, @song3]

        @room = Room.new("The Disco Room", 10, @guests, @songs)

    end

    def test_name()
        assert_equal("The Disco Room", @room.name)
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

    def test_add_song_to_queue()
        @room.add_song_to_queue(@song2)
        assert_equal(1, @room.song_queue.size())
    end

    def test_remove_song_from_queue()
        @room.add_song_to_queue(@song1)
        @room.add_song_to_queue(@song2)
        @room.remove_song_from_queue(@song1)
        assert_equal(1, @room.song_queue.size())
    end

    # def test_play_song()
    # end

    # def test_song_is_removed_once_played()
    # end

    # def test_find_song_name__song_found()
    #     result = @room.find_song_name(@song1.name)
    #     assert_equal("Don't stop believin'", result)
    # end

    # def test_find_song_name__not_found()
    # end

    # def test_find_songs_by_artist__found()
    # end

    # def test_find_songs_by_artist__not_found()
    # end
    
    # def test_add_songs_to_queue()
    #     assert_equal()
    # end

    # def test_empty_queue_when_guests_leave()
    # end
    


    # def test_sell_drink()
    # end

    # def test_increase_bar_tab()
    # end

end
