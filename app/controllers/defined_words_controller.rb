class DefinedWordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if user_id = params[:user_id]
      @user = User.find(user_id)
      @words = DefinedWord.where(user: @user)

      render :user_index
    elsif origin_id = params[:origin_id]
      @origin = Origin.find(origin_id)
      @words = @origin.defined_words
      render :origin_index
    end
  end

  def new
    @word = DefinedWord.new
  end

  def create
    @word = DefinedWord.new(word_params)

    if @word.save
      redirect_to root_path
    else
      @errors = @word.errors.full_messages
      render :new
    end
  end

  private
  def word_params
    params.require(:defined_word).permit(:word, :definition, :example, :origin_id, :user_id)
  end
end
