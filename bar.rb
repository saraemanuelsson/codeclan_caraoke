class Bar

    attr_reader :name, :rooms, :line

    def initialize(name, rooms)
        @name = name
        @rooms = rooms
        @till = 0
        @line = []
    end

    def total_money_in_till()
        return @till
    end

    def add_money_to_till(amount)
        @till += amount
    end

    def add_guest_to_line(guest)
        @line.push(guest)
    end

    def find_room_for_guest(guest, group_size)
        available_rooms = @rooms.find_all { |room| room.number_of_guests_in_room() == 0 }

        suitable_rooms_for_group = available_rooms.find_all { |room| room.capacity() > group_size }

        if suitable_rooms_for_group.size != 0
            suitable_rooms_for_group[0].check_in_guest(guest)
        else
            add_guest_to_line(guest)
        end
    end

    def charge_one_customer(room, guest)
        amount = room.bar_tab()

        if guest.money_in_wallet > amount
            guest.pay_bill(amount)
            add_money_to_till(amount)
        else
            return "Call the police!"
        end
    end
    
    def split_bill(room)
        amount = room.bar_tab()
        return amount / room.number_of_guests_in_room()
    end

    def charge_customer_split_bill(room, guest)
        amount = split_bill(room)
        
        if guest.money_in_wallet > amount
            guest.pay_bill(amount)
            add_money_to_till(amount)
        else
            return "Call the police!"
        end
    end

end