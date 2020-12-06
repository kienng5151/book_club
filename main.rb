     
require 'sinatra'
require 'sinatra/reloader' if development?
# if in sinatra, in heroku it will not use this
require 'pg'
require 'pry'
require 'bcrypt'

enable :sessions

def run_sql(sql)
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'book_club_db'})
  results = db.exec(sql)
  db.close
  results
end

def user_found(users)
  if users.to_a.length > 0
    users[0]
  else
    nil
  end
end

def logged_in?
  !!session[:user_id]
end

def current_user
  if logged_in?
    user_id = session[:user_id]
    users = run_sql("SELECT * FROM users WHERE id=#{user_id}")
    user = user_found(users)
  else
    nil
  end
end

def add_single_quote(book) 
  new_string = ""
  book.each_char do |char|
      new_string += char
      if char=="'"
          new_string += "'"
      end
  end
  return new_string
end

require_relative 'controllers/books_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/users_controller'




