
get '/login' do
    erb :'/sessions/login'
end

post '/sessions' do
    books = run_sql("SELECT * FROM books ORDER BY id")

    user_email = params['email']
    user_password = params['password']

    # logged_in_user_id = params['user_id']

    users = run_sql("SELECT * FROM users WHERE email='#{user_email}'")
    user = user_found(users)

    # logged_in_user = run_sql("SELECT * FROM users WHERE user_id='#{logged_in_user_id}'")

    if user && BCrypt::Password.new(user['password_digest']) == params['password']
        session[:user_id] = user['id']

    erb :'/users/book_library', locals: {
        users: users,
        user: user,
        books: books,

        # logged_in_user_id: logged_in_user_id,
        # logged_in_user: logged_in_user
    }

    else
        erb :'/sessions/login'
    end
end

delete '/sessions' do
    session[:user_id] = nil

    redirect '/'
end
