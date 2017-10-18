class CommentsController < ApplicationController
  def new
    @word = DefinedWord.find(params["defined_word_id"])
    @comment = Comment.new
  end
end
