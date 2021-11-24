class LettersController < ApplicationController

    def index
        @letters = Letter.all
    end

    def new
        @letter = Letter.new
        @letter.build_elf
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
        params.require(:letter).permit(:content, :elf_id, elf_attributes: [:name])
    end
end
