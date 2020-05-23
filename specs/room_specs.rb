require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
require_relative('../bar')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRoom < MiniTest::Test 

    def setup

        @guest1 = Guest.new("Bill", 3, "What does the fox say")
        @guest2 = Guest.new("Anna", 573, "I wanna dance with somebody")
        @guest3 = Guest.new("Linda", 47, "Whistle")
        
        @song1 = Song.new("Don't stop believin'", "Journey", 472)
        @song2 = Song.new("What does the fox say", "Ylvis", 28)
        @song3 = Song.new("Thrift shop", "Macklemore", 91)

        @songs = [@song1, @song2, @song3]

        @room = Room.new("The Disco Room", 5, @songs, 30)

    end

    def test_name()
        assert_equal("The Disco Room", @room.name)
    end

    def test_capacity()
        assert_equal(5, @room.capacity)
    end

    def test_price()
        assert_equal(30, @room.price_per_hour())
    end

    def test_check_in_guest()
        @room.check_in_guest(@guest1)
        @room.check_in_guest(@guest2)
        @room.check_in_guest(@guest3)
        assert_equal(3, @room.number_of_guests_in_room())
    end

    def test_check_in_guest__full_room()
        @room.check_in_guest(@guest1)
        @room.check_in_guest(@guest2)
        @room.check_in_guest(@guest3)
        @room.check_in_guest(@guest1)
        @room.check_in_guest(@guest2)
        @room.check_in_guest(@guest3)
        assert_equal(5, @room.number_of_guests_in_room())
    end

    def test_check_out_guest()
        @room.check_in_guest(@guest1)
        @room.check_in_guest(@guest2)
        @room.check_in_guest(@guest3)
        @room.check_out_guest(@guest2)
        assert_equal(2, @room.number_of_guests_in_room())
    end

    def test_clear_room()
        @room.clear_room()
        assert_equal(0, @room.number_of_guests_in_room())
    end

    def test_increase_songs_in_queue()
        @room.increase_songs_in_queue(@song2)
        assert_equal(1, @room.song_queue.size())
    end

    def test_remove_song_from_queue()
        @room.increase_songs_in_queue(@song1)
        @room.increase_songs_in_queue(@song2)
        @room.remove_song_from_queue(@song1)
        assert_equal(1, @room.song_queue.size())
    end

    def test_play_song()
        @room.increase_songs_in_queue(@song1)
        @room.increase_songs_in_queue(@song2)
        assert_equal(@song1, @room.play_song())
    end

    def test_song_is_removed_once_played()
        @room.increase_songs_in_queue(@song1)
        @room.increase_songs_in_queue(@song2)
        @room.play_song()
        assert_equal(1, @room.song_queue.size())
    end

    def test_all_songs_removed_when_guests_leave()
        @room.increase_songs_in_queue(@song1)
        @room.increase_songs_in_queue(@song2)
        @room.clear_room()
        assert_equal(0, @room.song_queue.size())
    end

    def test_increases_timer()
        @room.increase_timer(35)
        assert_equal(35, @room.timer())
    end

    def test_increase_bar_tab()
        @room.increase_bar_tab(50)
        assert_equal(50, @room.bar_tab())
    end

    def test_charge_per_booking()
        @room.increase_timer(123)
        assert_equal(90, @room.charge_per_booking())
    end

    # def test_find_song_by_name()
    #     result = @room.find_song_by_name("Thrift shop")
    #     assert_equal(@song3, result)
    # end

    # def test_find_songs_by_artist()
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

    # def test_sell_drink()
    # end

    # def test_increase_bar_tab()
    # end

end
