class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
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
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books=Book.all
      # @book=Book.new
      render 'index'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books=Book.all
      # @book=Book.new
      render 'edit'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path(@book)
    end
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
