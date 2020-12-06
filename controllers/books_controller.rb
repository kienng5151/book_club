
get '/' do
  erb :'books/index'
end

get '/users/book_library' do
  books = run_sql("SELECT * FROM books ORDER BY id")

  erb :'/users/book_library', locals: {
    books: books
  }
end

get '/books/new' do
  erb :'books/new'
end

post '/books' do
  book_title = params['title']
  book_author = params['author']
  book_category = params['category']
  book_genre = params['genre']
  book_about = params['about']
  book_image_url = params['image_url']
  
  book_title_add_quote = add_single_quote(book_title)
  book_about_add_quote = add_single_quote(book_about)

  run_sql("INSERT INTO books(title, author, category, genre, about, image_url) VALUES('#{book_title_add_quote}', '#{book_author}', '#{book_category}', '#{book_genre}', '#{book_about_add_quote}', '#{book_image_url}')")

  redirect '/users/book_library'
end

delete '/books/:id' do
  book_id = params['id']
  run_sql("DELETE FROM books WHERE id=#{book_id}")

  redirect '/users/book_library'
end

get '/books/:id/edit' do
  book_id = params['id']
  book = run_sql("SELECT * FROM books WHERE id=#{book_id}")
  book_item = book[0]

  erb :'books/edit', locals: {
    book_item: book_item
  }
end

patch '/books/:id' do
  book_id = params['id']
  book_title = params['title']
  book_author = params['author']
  book_category = params['category']
  book_genre = params['genre']
  book_about = params['about']
  book_image_url = params['image_url']

  book_title_add_quote = add_single_quote(book_title)
  book_about_add_quote = add_single_quote(book_about)

  run_sql("UPDATE books SET title='#{book_title_add_quote}', author='#{book_author}', category='#{book_category}', genre='#{book_genre}', about='#{book_about_add_quote}', image_url='#{book_image_url}' WHERE id=#{book_id}")

  redirect '/users/book_library'
end

