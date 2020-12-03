
get '/' do
  books = run_sql("SELECT * FROM books ORDER BY id")

  erb :'books/index', locals: {
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

  run_sql("INSERT INTO books(title, author, category, genre, about, image_url) VALUES('#{book_title}', '#{book_author}', '#{book_category}', '#{book_genre}', '#{book_about}', '#{book_image_url}')")

  redirect '/'
end

delete '/books/:id' do
  book_id = params['id']
  run_sql("DELETE FROM books WHERE id=#{book_id}")

  redirect '/'
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

  run_sql("UPDATE books SET title='#{book_title}', author='#{book_author}', category='#{book_category}', genre='#{book_genre}', about='#{book_about}', image_url='#{book_image_url}' WHERE id=#{book_id}")

  redirect '/'
end

