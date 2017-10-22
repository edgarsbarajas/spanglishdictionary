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
      respond_to do |f|
        f.html
        f.js { render 'comments/new_word_comment' }
      end
    elsif params["comment_id"]
      @main_comment = Comment.find(params["comment_id"])
      @comment = Comment.new
      respond_to do |f|
      f.html
      f.js { render 'comments/new_comment_comment' }
    end
    end


  end

  def create
    @text = params["comment"]["text"]

    if word_id = params["defined_word_id"]
      @word = DefinedWord.find(word_id)
      @comment = Comment.new(user: current_user, commentable_type: "DefinedWord", commentable_id: word_id, text: @text)

      if @comment.save
        respond_to do |f|
          f.html { redirect_to defined_word_comments_path(word_id) }
          f.js
        end
      else
        @comment = Comment.new
        @word = DefinedWord.find(params["defined_word_id"])
        @errors = comment.errors.full_messages
        render :new
      end
    elsif comment_id = params["comment_id"]
      @comment = Comment.new(user: current_user, commentable_type: "Comment", commentable_id: comment_id, text: @text)
      @main_comment = Comment.find(params["comment_id"])

      if @comment.save
        word = DefinedWord.all.select { |word| word.has_comment?(@main_comment)}

        respond_to do |f|
          f.html { redirect_to defined_word_comments_path(word) }
          f.js { render 'comments/create_comment_comment' }
        end
      else
        @comment = Comment.new
        @errors = new_comment.errors.full_messages
        render :new
      end
    end
  end
end
