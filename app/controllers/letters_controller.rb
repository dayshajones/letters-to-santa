class LettersController < ApplicationController

    def index
        @letter = Letter.all
    end

    def new
        @letter = Letter.new
    end

    def create
        @letter = current_user.letters.new(letter_params)
        if @letter.save
            redirect_to letters_path, notice: "Letter has been added to your collection."
        else
            render :new
        end
    end

    def edit

    end

    def update

    end


    def destroy

    end

    private

    def letter_params

    end

end
