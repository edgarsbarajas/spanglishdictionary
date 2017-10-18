class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @word = DefinedWord.find(params["defined_word_id"])
    @comment = Comment.new
  end

  def create
    text = params["comment"]["text"]

    if word_id = params["defined_word_id"]
      comment = Comment.new(user: current_user, commentable_type: "DefinedWord", commentable_id: word_id, text: text)

      if comment.save
        redirect_to root_path
      else
        @comment = Comment.new
        @word = DefinedWord.find(params["defined_word_id"])
        @errors = comment.errors.full_messages
        render :new
      end
    else params["comment_id"]

    end
  end
end
