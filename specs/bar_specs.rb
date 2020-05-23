require('minitest/autorun')
require('minitest/reporters')
require_relative('../bar')
require_relative('../room')
require_relative('../guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBar < MiniTest::Test

    def setup

        @songs = [@song1, @song2, @song3]

        @room1 = Room.new("The Disco Room", 5, @songs, 30)
        @room2 = Room.new("The Jazz Room", 15, @songs, 70)

        @bar = Bar.new("CodeClan Caraoke", @rooms)

        @guest1 = Guest.new("Bill", 3, "What does the fox say")
        @guest2 = Guest.new("Anna", 573, "I wanna dance with somebody")
        @guest3 = Guest.new("Linda", 47, "Whistle")

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

    # def test_find_empty_room()
    #     @room2.check_in_guest(@guest1)
    #     assert_equal([@room1], @bar.find_empty_room())
    # end

    # def test_add_customer_to_line_if_no_empty_room()
    # end

    # def test_add_customer_to_front_of_line_if_no_space_in_room()
    # end

    def test_charge_one_customer__enough_money()
        @room2.increase_timer(110)
        amount = @room2.charge_per_booking()
        @room2.increase_bar_tab(amount)
        @bar.charge_one_customer(@room2, @guest2)
        assert_equal(433, @guest2.money_in_wallet())
        assert_equal(140, @bar.total_money_in_till())
    end

    def test_charge_one_customer__not_enough_money()
        @room2.increase_timer(110)
        amount = @room2.charge_per_booking()
        @room2.increase_bar_tab(amount)
        result = @bar.charge_one_customer(@room2, @guest1)
        assert_equal("Call the police!", result)
        assert_equal(47, @guest3.money_in_wallet())
        assert_equal(0, @bar.total_money_in_till())
    end

    def test_split_bill()
        @room2.check_in_guest(@guest1)
        @room2.check_in_guest(@guest2)
        @room2.increase_timer(110)
        amount = @room2.charge_per_booking()
        @room2.increase_bar_tab(amount)
        assert_equal(70, @bar.split_bill(@room2))
    end

end