require_relative './dinosaur'
 
# I know I want a bunch of information about dinosaurs
# I will use the information to make DinosaurCliApi::Dinosaur Objects! And "persist"
# them into a class variable....

#getting the info...

# this functionality should be wrapped into a class
class DinosaurCli::API 
    BASE_URL = "https://dinosaur-facts-api.shultzlab.com"

  def self.get_all_dinosaurs
    response = RestClient.get("https://dinosaur-facts-api.shultzlab.com/dinosaurs")
    dinosaur_array = JSON.parse(response.body) ["results"]

    dinosaur_array.each do |dinosaur|
        Dinosaur.new(dinosaur)
    end
  end
end