require 'pry'


class CliDinosaur::Dinosaur 
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

    def self.find_by_name(name)
      # search through all the dinos...
      # if there is a dino whose name matches the incoming argument, return that instance of Dinosaur
      # if there are no matches, return nil
      # ideally, the search would be case-insensitive
      @@all.find  do |dinosaur| 
        dinosaur.name.downcase == name.downcase
      end
    end
end