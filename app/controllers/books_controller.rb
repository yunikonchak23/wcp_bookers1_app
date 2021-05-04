class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new(book_params)
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    #1.新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #2.データベースに保存するためのsaveメソッド実行
    if @book.save
    #3.Show画面へリダイレクト
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.permit(:title, :body)
  end

end
