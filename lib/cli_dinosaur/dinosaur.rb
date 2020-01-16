class Dinosaur
    # BASE_URL = "https://dinosaur-facts-api.shultzlab.com/"

    attr_accessor :name, :description
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.save
        @@all
    end

    def self.reset_all

    end

   
    
end