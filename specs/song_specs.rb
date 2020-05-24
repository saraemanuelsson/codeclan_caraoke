require('minitest/autorun')
require('minitest/reporters')
require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSong < MiniTest::Test 

    def setup()
        @song = Song.new("Waterloo", "ABBA")
    end

    def test_name()
        assert_equal("Waterloo", @song.name())
    end

    def test_artist()
        assert_equal("ABBA", @song.artist())
    end

end
