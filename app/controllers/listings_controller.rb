class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]


    def index
        @listings = Listing.all
    end

    def show

    end

    def new
        @breeds=Breed.all #variable for new view for selector form
        @sexes= Listing.sexes.keys #a way to access the snake sexes, as it's an enumerable
        #if it was a modle we could so @sexes=Sex.all
        @listing = Listing.new
    end

    def create
        #finish logic for creating a record
        @listing=Listing.create(listing_params)
        if @listing.errors.any? #if any errors is true
            set_breeds_and_sexes
            render "new" #re-render new page
        end
        # puts @listing.errors.any? #check if any errors come up, will output true if there is error
        # puts @listing.errors.full_messages #displays a fuller error message
    end

    def edit
    end

    def update
        #finsih logic for updating the record
    end

    def destroy
        
        #finish logic for deleting the record
    end

    private

    def set_listing
        @listing = Listing.find(params[:id])
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :city, :state, :deposit, :date_of_birth, :diet, :picture)
    end

    def set_breeds_and_sexes
        @breeds=Breed.all 
        @sexes= Listing.sexes.keys
    end

end