require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestGuest < MiniTest::Test 

    def setup()
        @guest = Guest.new("Sara", 140, "ABC")
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

end