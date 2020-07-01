class KittensController < ApplicationController

  def index
    @kittens = Kitten.all.order(:created_at => "DESC")

    respond_to do |format|
      format.html #{ render :html => @kittens }
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html #{ render :html => @kitten }
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.create(kitten_params)

    @kitten.name.capitalize!
    @kitten.cuteness.capitalize!
    @kitten.softness.capitalize!

    if @kitten.save
      flash[:notice] = "Kitten successfully created"
      redirect_to @kitten
    else
      flash[:alert] = "Something went wrong, please check your input"
      render :new
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)

    if @kitten.save
      flash[:notice] = "Kitten successfully updated"
      redirect_to kitten_path
    else
      flash[:alert] = "Something went wrong, please check your input"
      render :edit
    end
  end


  def destroy
    @kitten = Kitten.find(params[:id])

    if @kitten.destroy
      flash[:notice] = "'#{@kitten.name}' successfully deleted."
      redirect_to @kitten
    else
      flash[:alert] = "Unable to delete '#{@kitten.name}'"
      render :show
    end
  end




  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
