class DinosaurCli::Dinosaur 
    attr_accessor :name, :description

    @@all = []

    def initialize(attr_hash)
        attr_hash.each do |key, value|
            self.send("#{key.downcase}=", value) if self.respond_to?("#{key.downcase}=")
          end
         save  
    end

    def save
        @@all << self
    end

    def self.all
      @@all 
    end

end