class ParksController < ApplicationController
  before_action :set_park, only: [:show, :edit, :update, :destroy, :add_dog, :new_dog]

  # GET /parks
  # GET /parks.json
  def index
    @parks = Park.all
  end

  # GET /parks/1
  # GET /parks/1.json


  # GET /parks/new
  def new
    @park = Park.new
  end

  # GET /parks/1/edit
  def edit
  end

  def show
    @user = current_user
  end

  def new_dog
    @user = current_user
  end

  # POST /parks
  # POST /parks.json
  def create
    @park = Park.new(park_params)

    respond_to do |format|
      if @park.save
        format.html { redirect_to @park, notice: 'Park was successfully added.' }
        format.json { render :show, status: :created, location: @park }
      else
        format.html { render :new }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parks/1
  # PATCH/PUT /parks/1.json
  def update
    respond_to do |format|
      if @park.update(park_params)
        format.html { redirect_to @park, notice: 'Park was successfully updated.' }
        format.json { render :show, status: :ok, location: @park }
      else
        format.html { render :edit }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
    @park.destroy
    respond_to do |format|
      format.html { redirect_to parks_url, notice: 'Park was successfully removed.' }
      format.json { head :no_content }
    end
  end

  def add_dog
    dog_name = params['dog_name']
    dog = Dog.find_by(name: dog_name)
    # If the dog isn't there return to page with error message
    if dog.nil?
      return redirect_to @park, flash: { error: 'Could not find dog' }
    end

    if @park.dogs.include? dog
      return redirect_to @park, flash: { error: 'Dog is already there' }
    end

    walk = Walk.create({dog: dog, park: @park, time: params['time']})

    # @park.dogs << dog
    # @park.save!
    redirect_to @park, notice: "Successfully added #{dog_name}!"
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_params
      from_params = params.require(:park).permit(:name, :address, :offlead, :fence, :bag, :latitude, :longitude)
      from_params.transform_values {|element|
        element.strip
      }
    end
end
