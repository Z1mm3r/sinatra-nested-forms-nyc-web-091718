require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here

    get '/' do
      erb :root
    end

    get '/new' do
      erb :"/pirates/new"
    end

    post '/pirates' do

      @pirate = Pirate.new
      @pirate.name = params["pirate"]["name"]
      @pirate.weight = params["pirate"]["weight"]
      @pirate.height = params["pirate"]["height"]

      params["pirate"]["ships"].each do |ship|
        @ship = Ship.new
        @ship.name = ship["name"]
        @ship.type = ship["type"]
        @ship.booty = ship["booty"]
      end

      erb :"/pirates/show"
    end
  end
end
