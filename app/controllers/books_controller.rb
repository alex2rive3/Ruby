class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  
  def new
    @book = Book.new
  end  
  def show
   @book = Book.find(params[:id])
  end

  def index

    @books = Book.order("title DESC")
    @books = Book.paginate(:page=>params[:page],per_page:6).order("created_at desc")   

    if params[:title].present?
      @books = @books.where("title LIKE ?", "%#{params[:title]}%")



    elsif params[:title] == params[:title].nil?
      flash[:notice] = "No hay coincidencias"
 

    end

  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to @book
  else
    render :edit
  end
  end
    def create
      @book = Book.new(book_params)
      @book.user = current_user
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy

    flash[:notice] = "El libro ha sido eliminado exitosamente"
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :author, :description, :image_url, :publication_date, :price. :user_id)
  end
end
