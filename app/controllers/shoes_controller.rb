class ShoesController < ApplicationController
  def index
    @shoes = Shoe.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @movies }

      format.html
    end
  end

  def new
    @shoe = Shoe.new
    shoes_and_sizes()
  end

  def create
    @shoe = Shoe.new(shoe_attributes)

    if @shoe.valid?
      @shoe.save
      redirect_to "/shoes", notice: "Shoe created successfully"
    else
      render "new"
    end
  end

  def show
    @shoe = Shoe.find(params.fetch(:id))
  end

  def edit
    @shoe = Shoe.find(params.fetch(:id))
    shoes_and_sizes()
  end

  def update
    @shoe = Shoe.find(params.fetch(:id))
    #shoe_attributes = params.require(:shoe).permit(:image, :title, :description, :deadstock, :authentic)
    #shoe = Shoe.where(shoe_attributes)

    # shoe.image = params.fetch(:image)
    # shoe.title = params.fetch(:title)
    # shoe.description = params.fetch(:description)
    # shoe.deadstock = params.fetch(:deadstock)
    # shoe.authentic = params.fetch(:authentic)

    if @shoe.update(shoe_attributes)
      #redirect_to shoe_url(shoe), notice: "Movie successfully updated"
      redirect_to @shoe, notice: "Movie updated successfully"
    else
      #redirect_to shoe_url(shoe), alert: "Movie failed to update successfully"
      render "edit"
    end
  end

  def destroy
    #@shoe = Shoe.find(params.fetch(:id))

    #@shoe.destroy

    the_id = params.fetch(:id)
    movie = Movie.where({ :id => the_id }).first

    movie.delete

    redirect_to shoes_url, notice: "Shoe deleted successfully"
    #redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end

  private 

  def shoes_and_sizes
    @sizes = []
    @shoe_types = ['Mens', 'Womens', 'Big Kids', 'Little Kids', 'Toddlers']

    (1..18).each do |count| 
      @sizes.push(count.to_s)
    end 
  end

  def shoe_attributes
    shoe_attributes = params.require(:shoe).permit(:image, :title, :description, :deadstock, :authentic)
  end
end
