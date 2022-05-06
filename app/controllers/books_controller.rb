class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
    else
     render :new
    end
  end
  
  def new
    @book = Book.new
    @books = Book.all
  end

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to new_book_path
  end
  
private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
