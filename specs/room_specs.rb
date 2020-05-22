require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
require_relative('../group')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRoom < MiniTest::Test 

    def setup

        @room = Room.new("Burn Baby Burn", 10)

        @song1 = Song.new("Don't stop believin'", "Journey")
        @song2 = Song.new("Livin' on a prayer", "Bon Jovi")
        @song3 = Song.new("Thrift shop", "Macklemore")

        @songs = [@song1, @song2, @song3]

    end

    def test_name()
        assert_equal("Burn Baby Burn", @room.name)
    end

    def test_capacity()
        assert_equal(10, @room.capacity)
    end



end
