class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @word = DefinedWord.find(params["defined_word_id"])
    @comment = Comment.new
  end

  def create
    comment = params["comment"]["text"]

    if word_id = params["defined_word_id"]
      Comment.create(user: current_user, commentable_type: "DefinedWord", commentable_id: word_id, text: comment)
    else params["comment_id"]

    end
  end
end
