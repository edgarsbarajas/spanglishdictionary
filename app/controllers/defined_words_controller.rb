class DefinedWordsController < ApplicationController
  def new
    @word = DefinedWord.new
  end

  def create
    @word = DefinedWord.new(word_params)

    if @word.save
      redirect_to new_defined_word_path
    else
      @errors = @word.errors.full_messages
      render :new
    end
  end

  private
  def word_params
    params.require(:defined_word).permit(:word, :definition, :origin_id, :user_id)
  end
end
