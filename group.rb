class Group

    attr_reader :guests

    def initialize(guests = [])
        @guests = guests
    end

    def group_size()
        return @guests.size()
    end

end