class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js, :html, :json

  def index
    @word = DefinedWord.find(params["defined_word_id"])
    @comments = @word.comments

    respond_to do |f|
      f.html {}
      f.js
    end
  end

  def new
    if params["defined_word_id"]
      @word = DefinedWord.find(params["defined_word_id"])
      @comment = Comment.new
    elsif params["comment_id"]
      @main_comment = Comment.find(params["comment_id"])
      @comment = Comment.new
    end
  end

  def create
    text = params["comment"]["text"]

    if word_id = params["defined_word_id"]
      comment = Comment.new(user: current_user, commentable_type: "DefinedWord", commentable_id: word_id, text: text)

      if comment.save
        redirect_to defined_word_comments_path(word_id)
      else
        @comment = Comment.new
        @word = DefinedWord.find(params["defined_word_id"])
        @errors = comment.errors.full_messages
        render :new
      end
    elsif comment_id = params["comment_id"]
      new_comment = Comment.new(user: current_user, commentable_type: "Comment", commentable_id: comment_id, text: text)
      @main_comment = Comment.find(params["comment_id"])

      if new_comment.save

        word = DefinedWord.all.select { |word| word.has_comment?(@main_comment)}

        redirect_to defined_word_comments_path(word)
      else
        @comment = Comment.new
        @errors = new_comment.errors.full_messages
        render :new
      end
    end
  end
end
