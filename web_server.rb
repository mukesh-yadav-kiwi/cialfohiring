require 'sinatra'
require 'pp'
require 'json'
require 'kaminari/sinatra'
require 'padrino-helpers'

helpers Kaminari::Helpers::SinatraHelpers


get '/' do
  json_data = File.read("output.json");
  json_hash = JSON.parse(json_data)
  @school = Kaminari.paginate_array(json_hash).page(params[:page]).per(10)
  erb :index
end
