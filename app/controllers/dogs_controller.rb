class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :new, :create, :destroy]
  before_action :authorize_dog, only: [:edit, :update, :destroy]



  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
    @user = current_user
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @user = current_user
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)

    @dog.user = current_user

    respond_to do |format|
      if @dog.save
        format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: "#{@dog.name}'s details were successfully updated." }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to '/profile', notice: "#{@dog.name} was successfully removed from ParkPups." }
      format.json { head :no_content }
    end
  end

  def remove_dog
    @park = Park.find(params[:park_id])
    @dog = Dog.find(params[:dog_id])
    return redirect_to @dog unless @dog.authorize(current_user)

    @park.dogs.delete(@dog)
    redirect_to @dog, notice: "Successfully removed #{@dog.name} from #{@park.name}!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Make sure it's your dog
    def authorize_dog
      redirect_to dogs_path unless @dog.authorize(current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      from_params = params.require(:dog).permit(:name, :age, :breed, :owner, :about)
      from_params.transform_values {|element|
        element.strip
      }
    end
end
