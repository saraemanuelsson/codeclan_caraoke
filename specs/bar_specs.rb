require('minitest/autorun')
require('minitest/reporters')
require_relative('../bar')
require_relative('../room')
# require_relative('../guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBar < MiniTest::Test

    def setup

    @songs = [@song1, @song2, @song3]

    @room1 = Room.new("The Disco Room", 5, @songs, 30)
    @room2 = Room.new("The Jazz Room", 15, @songs, 70)

    @bar = Bar.new("CodeClan Caraoke", @rooms)

    end

    def test_name()
        assert_equal("CodeClan Caraoke", @bar.name)
    end

    def test_total_money_in_till()
        assert_equal(0, @bar.total_money_in_till())
    end

    def test_add_money_to_till()
        @bar.add_money_to_till(10)
        assert_equal(10, @bar.total_money_in_till())
    end

end