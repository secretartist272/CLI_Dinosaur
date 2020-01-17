class DinosaurCli::Dinosaur
    # BASE_URL = "https://dinosaur-facts-api.shultzlab.com/"

    attr_accessor :name, :description

    @@all = []

    def initialize(attr_hash)
        attr_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
          end
          self.save  
    end

    def self.save
        @@all << self
    end

    def self.all
      @@all 
    end

end