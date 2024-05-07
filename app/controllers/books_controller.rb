class BooksController < ApplicationController
  def create
    book = Book.new(book_param)
    book.save
    # 新規作成後一覧に戻る
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
    # 更新後は更新したidのデータを表示する
    redirect_to show_book_url(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    # 削除後は一覧に戻る
    redirect_to books_path
  end

  private
  def book_param
    params.require(:book).permit(:title, :body)
  end
end
