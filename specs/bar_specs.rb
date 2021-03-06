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

        @rooms = [@room1, @room2]

        @bar = Bar.new("CodeClan Caraoke", @rooms)

        @guest1 = Guest.new("Bill", 3, "What does the fox say")
        @guest2 = Guest.new("Anna", 573, "I wanna dance with somebody")
        @guest3 = Guest.new("Linda", 47, "Whistle")

        @guests = [@guest1, @guest2, @guest3, @guest1, @guest2, @guest3]

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

    def test_add_guest_to_line()
        @bar.add_guest_to_line(@guest1)
        @bar.add_guest_to_line(@guest2)
        assert_equal(2, @bar.line.size())
    end

    def test_find_room_for_guests__room_available()
        @bar.find_room_for_guests(@guests)
        assert_equal(6, @room2.number_of_guests_in_room())
    end

    def test_guests_added_to_line_if_no_room_available()
        group_of_guests = [@guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1, @guest1,]
        @bar.find_room_for_guests(group_of_guests)
        assert_equal(16, @bar.line.size())
    end

    # def test_find_room_for_guest__room_available()
    #     @bar.find_room_for_guest(@guest1, 7)
    #     assert_equal(1, @room2.number_of_guests_in_room())
    # end

    # def test_guest_added_to_line_if_no_room_available()
    #     @bar.find_room_for_guest(@guest3, 16)
    #     assert_equal(1, @bar.line.size())
    # end

    def test_charge_one_customer__enough_money()
        @room2.increase_bar_tab(140)
        @bar.charge_one_customer(@room2, @guest2)
        assert_equal(433, @guest2.money_in_wallet())
        assert_equal(140, @bar.total_money_in_till())
    end

    def test_charge_one_customer__not_enough_money()
        @room2.increase_bar_tab(362)
        result = @bar.charge_one_customer(@room2, @guest1)
        assert_equal("Call the police!", result)
        assert_equal(47, @guest3.money_in_wallet())
        assert_equal(0, @bar.total_money_in_till())
    end

    def test_split_bill()
        @room2.check_in_guest(@guest1)
        @room2.check_in_guest(@guest2)
        @room2.increase_bar_tab(140.0)
        assert_equal(70.0, @bar.split_bill(@room2))
    end

    def test_charge_customer_split_bill__enough_money()
        @room2.check_in_guest(@guest2)
        @room2.check_in_guest(@guest3)
        @room2.increase_bar_tab(20.0)
        @bar.charge_customer_split_bill(@room2, @guest2)
        assert_equal(563, @guest2.money_in_wallet())
        assert_equal(10, @bar.total_money_in_till())
    end

    def test_charge_customer_split_bill__not_enough_money()
        @room2.check_in_guest(@guest2)
        @room2.check_in_guest(@guest3)
        @room2.increase_bar_tab(100.0)
        result = @bar.charge_customer_split_bill(@room2, @guest3)
        assert_equal("Call the police!", result)
        assert_equal(47, @guest3.money_in_wallet())
        assert_equal(0, @bar.total_money_in_till())
    end

end