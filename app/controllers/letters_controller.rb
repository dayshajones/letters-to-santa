class LettersController < ApplicationController
    before_action :redirect_if_not_logged_in
    
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
        find_letter
        @letter.update(letter_params)
        if @letter.valid?
            redirect_to letters_path
        else
            render :edit
        end
    end

    def show
    end

    def destroy
        @letter.destry
        redirect_to letters_path
    end

    private 

    def letter_params
        params.require(:letter).permit(:content, :elf_id, elf_attributes: [:name])
    end

    def find_letter
        @letter = Letter.find(params[:id])
    end
end
