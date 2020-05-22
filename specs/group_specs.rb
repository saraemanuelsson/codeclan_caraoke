require('minitest/autorun')
require('minitest/reporters')
require_relative('../group')
require_relative('../guest')

Minitest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TestGroup < MiniTest::Test 

    def setup()
        @guest1 = Guest.new("Bill", 3, "What does the fox say")
        @guest2 = Guest.new("Anna", 573, "I wanna dance with somebody")
        @guest3 = Guest.new("Linda", 47, "Whistle")

        @group = Group.new([@guest1, @guest2, @guest3])

    end

    def test_group_size()
        assert_equal(3, @group.group_size())
    end

end