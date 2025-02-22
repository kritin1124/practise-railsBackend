json.extract! book, :id, :created_at, :updated_at, :name
json.url book_url(book, format: :json)
