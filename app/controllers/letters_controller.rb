class LettersController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_letter, except: [:index, :new, :create]
    before_action :logged_in_user, only: [:edit, :update, :delete]

  def index
      if params[:elf_id] && @elf = Elf.find(params[:elf_id])
          @letters = @elf.letters
      else
          @letters = Letter.all
      end
  end

  def new 
      if params[:elf_id]
        @elf = Elf.find_by(id: params[:elf_id])
        @letter = @elf.letters.build
      else 
        @letter = Letter.new
        @letter.build_elf
      end
    end
    
  def create
      if params[:elf_id]
        @elf = Elf.find_by(id: params[:elf_id])
        @letter = @elf.letters.build(letter_params)
      else 
        @letter = Letter.new(letter_params)
      end
      if @letter.save 
        redirect_to elf_letters_path(@letter.elf)
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
        params.require(:letter).permit(:content, :user_id, :elf_id, elf_attributes: [:name])
    end

    def find_letter
        @letter = Letter.find(params[:id])
    end

    def logged_in_user
      unless current_user == @letter.user
        redirect_to login_path
      end
    end

end