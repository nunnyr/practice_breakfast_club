# # create files for your ruby classes in this directory


# # nyc_apt = Listing.new("Nunny")
# # puts nyc_apt.guests

require 'pry'


class Listing

    @@all = []
    attr_accessor :listing_name

        def initialize(listing_param)
            @listing_name = listing_param
            @@all << self
        end


        def self.all
            @@all
        end

       
        def trips
            #Use enumerable to loop through Trips
            #Trip.all is our class variable that holds all the trips
            #We want all the trips that match self. 
            Trip.all.select do |trip_info|
                trip_info.listing == self 
                #binding.pry
                
            end    

        end


        def guests 
            self.trips.map do |trip_param|
                trip_param.guest.name
                #binding.pry
            end
        end

        def trip_count
            visited = trips.count
            # binding.pry

        end

        def self.find_all_by_city(string)
            #using SELECT to iterate through Trip.all class variable
            Trip.all.select { |city_listing|
                city_listing.listing.listing_name == city_listing
               # binding.pry
            }

        end

        def self.most_popular
            #iterate through Trip.all
            #It should count which Listing is the most popular
            #Return the listing

          #  counting = Trip.all 


            @@all.max_by { |listing_winner|
                listing_winner.trip_count
                   # binding.pry
            }
        end

end

Listing.most_popular




class Trip

    @@all = []
    #Listing and Guest objects are being returned therefore 
    #only need to be read
    attr_reader :listing, :guest #gets
    #attr_writer                 #sets
    #attr_accessor               #gets + sets

    def initialize(listing_inst, guest_inst)
        @listing = listing_inst
        @guest = guest_inst
        @@all << self

    end

    def self.all
        @@all
    end
end


class Guest

    @@all = []
    attr_accessor :name

    def initialize(name_param)
        @name = name_param
        @@all << self

    end

    def self.all
        @@all
    end

    def listings
        self.trips.map { |trip_info|
            trip_info.listing
            #binding.pry
        }

    end


    def trips
       
        Trip.all.select do |trip_info|
            trip_info.guest == self 
            #binding.pry
            
        end    

    end



    def trip_count 
        trips.count
    end 

    def self.pro_traveller

        self.all.select { |trip_info|

        trip_info.trip_count > 1
    
    
    }


    end 

    def self.find_all_by_name(string)
        #using SELECT to iterate through Trip.all class variable
        Trip.all.select { |guest_name|
            #binding.pry
            guest_name.guest.name == string
           #binding.pry
        }

    end
    


end



# south_america = Guest.new("Daisy")

listing_inst_one = Listing.new("NYC")
listing_inst_two = Listing.new("South America")
listing_inst_three = Listing.new("Jamaica")
listing_inst_four = Listing.new("Barbados")
listing_inst_five = Listing.new("India")
#listing_inst_six = Listing.new("South America")



guest_inst_one = Guest.new("Shema")
guest_inst_two = Guest.new("Hortencia")
guest_inst_three = Guest.new("Samir")
guest_inst_four = Guest.new("Patrick")
guest_inst_five = Guest.new("Emmanuel")
guest_inst_six = Guest.new("Nunny")



trip_test_one = Trip.new(listing_inst_one, guest_inst_one)
trip_test_two = Trip.new(listing_inst_two, guest_inst_two)
trip_test_three = Trip.new(listing_inst_three, guest_inst_three)
trip_test_four = Trip.new(listing_inst_four, guest_inst_four)
trip_test_five = Trip.new(listing_inst_five, guest_inst_five)
trip_test_six = Trip.new(listing_inst_two, guest_inst_six)
trip_test_seven = Trip.new(listing_inst_one, guest_inst_six)
trip_test_eleven = Trip.new(listing_inst_three, guest_inst_six)
trip_test_ten = Trip.new(listing_inst_five, guest_inst_six)
trip_test_eight = Trip.new(listing_inst_one, guest_inst_five)
trip_test_nine = Trip.new(listing_inst_four, guest_inst_two)





# listing_inst.guests
#binding.pry

 #nyc_apt = Listing.new("Nunny")
#listing_inst_two.trips
Listing.find_all_by_city("South America")
Listing.most_popular

guest_inst_six.listings
 binding.pry



