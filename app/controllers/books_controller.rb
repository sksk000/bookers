class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    book = Book.new(book_param)
    book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
  end

  private
  def book_param
    params.require(:book).permit(:title, :body)
  end
end
