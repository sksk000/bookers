class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_param)
    book.save
    redirect_to books_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  def book_param
    params.require(:book).permit(:title, :body)
  end
end
