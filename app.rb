require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new
      @pirate.name = params[:pirate][:name]
      @pirate.weight = params[:pirate][:weight]
      @pirate.height = params[:pirate][:height]

      @ship1 = Ship.new
      @ship1.name = params[:pirate][:ships][0][:name]
      @ship1.type = params[:pirate][:ships][0][:type]
      @ship1.booty = params[:pirate][:ships][0][:booty]

      @ship2 = Ship.new
      @ship2.name = params[:pirate][:ships][1][:name]
      @ship2.type = params[:pirate][:ships][1][:type]
      @ship2.booty = params[:pirate][:ships][1][:booty]

      erb :"pirates/show"
    end
  end
end
