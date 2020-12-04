
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


# WORK IN PROGRESS FOR MONTHLY MEMBERSHIP SIGNUP

get '/monthly' do
    erb :'users/monthly'
end

post '/membership_monthly' do
    user_first_name = params['first_name']
    user_last_name = params['last_name']
    user_email = params['email']
    user_password = params['password']
    password_digest = BCrypt::Password.create(user_password)
    user_card_number = params['card_number']
    user_card_expiry_date = params['card_expiry_date']
    user_card_cvc = params['card_cvc']
  
    # NEED TO ADD NEW COLUMNS IN users TABLE
    # NEED TO UPDATE in schema.sql AS WELL
    run_sql("INSERT INTO users(first_name, last_name, email, password_digest, card_number, card_expiry_date, card_cvc) VALUES('#{user_first_name}', '#{user_last_name}', '#{user_email}', '#{password_digest}', '#{user_card_number}', '#{user_card_expiry_date}', '#{user_card_cvc}')")

    redirect '/'   # redirect to homepage OR to another page with successful monthly membership signed up page?
end


# WORK IN PROGRESS FOR ANNUAL MEMBERSHIP SIGNUP

get '/annual' do
    erb :'users/annual'
end

post '/membership_annual' do
    user_first_name = params['first_name']
    user_last_name = params['last_name']
    user_email = params['email']
    user_password = params['password']
    password_digest = BCrypt::Password.create(user_password)
    user_card_number = params['card_number']
    user_card_expiry_date = params['card_expiry_date']
    user_card_cvc = params['card_cvc']
  
    # NEED TO ADD NEW COLUMNS IN users TABLE
    # NEED TO UPDATE in schema.sql AS WELL
    run_sql("INSERT INTO users(first_name, last_name, email, password_digest, card_number, card_expiry_date, card_cvc) VALUES('#{user_first_name}', '#{user_last_name}', '#{user_email}', '#{password_digest}', '#{user_card_number}', '#{user_card_expiry_date}', '#{user_card_cvc}')")

    redirect '/'   # redirect to homepage OR to another page with successful annual membership signed up page?
end