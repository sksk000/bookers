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
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_param)
    redirect_to show_book_url(book.id)
  end

  private
  def book_param
    params.require(:book).permit(:title, :body)
  end
end
