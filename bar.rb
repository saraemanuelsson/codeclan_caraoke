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


end