require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './models'
require 'rss'

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user])
  end
end

# to debug
get '/index' do
  @articles = Article.all#.limit(20).order("created_at desc") 
  @categories = Category.all
  
  url = "http://news.yahoo.co.jp/pickup/rss.xml"
  @rss = RSS::Parser.parse(url)
  
  erb :index
end

get '/info_form' do
  erb :info_form
end


get '/' do
  @articles = Article.all
  @categories = Category.all
  
  url = "http://news.yahoo.co.jp/pickup/rss.xml"
  @rss = RSS::Parser.parse(url)

  current_user = User.find_by(id: session[:user])
  
  if current_user.nil?
    erb :top
  else
    erb :index
  end
  
end



get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  @user = User.create(
    username: params[:username],
    mail: params[:mail],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
  )
  
  session[:user] = user.id
  
  redirect '/'
  
end


get '/sign_in' do
  erb :sign_in
end

post '/sign_in' do
  @user = User.find_by(username: params[:username])
  
  if @user && @user.authenticate(params[:password])
    session[:user] = @user.id
  end
  
  redirect '/'
  
end


get '/sign_out' do
  session[:user] = nil
  redirect '/'
end



get '/scrap' do
  erb :scrap_form
end

post '/scrap' do
  Article.create({
    title: params[:title],
    content: params[:content],
    souce: params[:souce],
    category_id: params[:name],
    # keyword: params[:keyword],
    url: params[:url],
    summary1: params[:summary1],
    summary2: params[:summary2],
    summary3: params[:summary3],
    comment: params[:comment],
    })
    
  redirect '/scrap'
  
end

post '/article/:id/favorite/' do
  @article = Article.find(params[:id])
  @article.favorite = !@article.favorite
  
  @article.save
  redirect '/'
end

# post '/article/search' do
#   @articles = Article.all
#   @categories = Category.all
  
#   Article.where(keyword: params[:keyword])
  
# end

get '/article/:id/detail' do
  @article = Article.find_by({id: params[:id]})
  
  erb :detail
end


get '/article/:id/edit' do
  @categories = Category.all
  @articles = Article.find_by({id: params[:id]})
  
  if @articles.nil?
    redirect '/'
  end
  
  erb :edit
  
end


post '/article/:id/update' do
  @article = Article.find_by({id: params[:id]})
  
  if @article.nil?
      redirect '/'
  end
    
  @article.update({
    title: params[:title],
    content: params[:content],
    souce: params[:souce],
    url: params[:url],
    category_id: params[:name],
    keyword: params[:keyword],
    summary1: params[:summary1],
    summary2: params[:summary2],
    summary3: params[:summary3],
    comment: params[:comment],
    favorite: params[:favorite],
  })
  
  @article.save
  
  redirect '/'
  
end


get '/article/:id/delate' do
  @article = Article.find_by({id: params[:id]})
  
  unless @article.nil?
  @article.destroy
  end

  redirect '/'
end