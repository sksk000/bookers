class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_param)
    if book.save
      flash[:notice] = "Book was successfully created."
      # 新規作成後一覧に戻る
      redirect_to show_book_path(book.id)
    else
      flash.now[:alert] = "error Book was successfully created."
      @error_count = book.errors.count;
      @error_msgs = book.errors.full_messages;
      @book = Book.all;
      # 新規作成失敗したので、ページ遷移しない
      render :index
    end

  end

  def index
    @book = Book.all

    # エラーメッセージ数とメッセージを格納する変数を用意する
    @error_count = 0
    @error_msgs = ""
  end

  def show
    bookdata = Book.find_by(id: params[:id])
    if bookdata == nil
      render "books/deletedata"
    else
      @book = Book.find(params[:id])
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_param)
      flash[:notice] = "Book was successfully updated."
      # 更新後は更新したidのデータを表示する
      redirect_to show_book_path(book.id)
    else
      flash.now[:alert] = "error Book was successfully updated."

      # edit画面では@bookを使用して表示している為、bookの情報を渡す
      @book = book

      # 更新失敗しているので、遷移しない
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    # 削除後は一覧に戻る
    redirect_to books_path
  end

  private
  def book_param
    params.require(:book).permit(:title, :body)
  end
end
