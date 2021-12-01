class LettersController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_letter, except: [:index, :new, :create]

    def index
        if params[:elf_id] && @elf = Elf.find(params[:elf_id])
            @letters = @elf.letters
        else
            @letters = Letter.all
        end
    end

    def new
        if params[:elf_id] && @elf = Elf.find(params[:elf_id])
            @letter = Letter.new(elf_id: params[:elf_id])
        else
            @letter = Letter.new
            @letter.build_elf
        end
    end

    def create
        @elf = Elf.find(params[:letter][:elf_id])
        @letter = current_user.letters.new(letter_params)
        if @letter.save
            redirect_to elf_letters_path
        else
            render :new
        end
    end

    def edit
    end

    def update
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
