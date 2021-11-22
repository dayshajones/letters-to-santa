class ElvesController < ApplicationController

    def index
        @elves = Elf.all
    end

    def show
        @elf = Elf.find(params[:id])
    end

    def new
        @elf = Elf.new
    end

    def create
        @elf = Elf.new(elf_params)
        if @elf.save
            redirect_to elf_path(@elf)
        else
            render :new
        end
    end

    private

    def elf_params
        params.require(:elf).permit(:name)
    end
end
