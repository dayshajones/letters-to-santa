class LettersController < ApplicationController

    def index
        @letter = Letter.all
    end

end
