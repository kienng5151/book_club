
get '/signup' do
    erb :'users/signup'
end
  
post '/users' do
    user_first_name = params['first_name']
    user_last_name = params['last_name']
    user_email = params['email']
    user_password = params['password']
    password_digest = BCrypt::Password.create(user_password)
  
    run_sql("INSERT INTO users(first_name, last_name, email, password_digest) VALUES('#{user_first_name}', '#{user_last_name}', '#{user_email}', '#{password_digest}')")

    redirect '/'
end