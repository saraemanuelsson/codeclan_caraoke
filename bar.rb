class Bar

    attr_reader :name, :rooms, :till, :line

    def initialize(name, rooms)
        @name = name
        @rooms = rooms
        @till = 0
        @line = []
    end

    

end