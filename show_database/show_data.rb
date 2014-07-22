require 'mysql2'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end
con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root')
enable :sessions
set :session_secret, 'randomesecretkey112324'

get '/' do
@res=con.query("show databases")
erb :list_database
end 
get '/use' do
@doc = params[:db_name]
con.query("use #{@doc}")
@res=con.query("show tables")
erb :show_tables
end
get '/contents' do
@n = params[:table]
@res = con.query("select * from #{@n}")
erb :contents
end
