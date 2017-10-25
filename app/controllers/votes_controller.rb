class VotesController < ApplicationController
  # protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def create
    # replicated the authenticate_user method because I was using AJAX to update the votes on a word.
    # When the user would vote, errors would be thrown (401 authentication), and the user wouldnt be redirected to login
    if !user_signed_in?
      respond_to do |f|
        f.html { redirect_to new_user_session_path }
        f.js { render "shared/not_signed_in" }
      end
    else
      if word_id = params["defined_word_id"]
        @word = DefinedWord.find(word_id)
        if params["commit"] == "upvote"
          # if upvote doesnt exist
          if !Vote.where(user: current_user, voteable_type: "DefinedWord", voteable_id: word_id, upvote: true).exists?
            # create it
            Vote.create(user: current_user, voteable_id: word_id, voteable_type: "DefinedWord", value: 1, upvote: true)
            # delete the downvote on the word from that user if it exists
            if downvote = Vote.find_by(user: current_user, voteable_id: word_id, voteable_type: "DefinedWord", upvote: false)
              downvote.delete
            end
          end
        elsif params["commit"] == "downvote"
          # if downvote doesnt exist
          if !Vote.where(user: current_user, voteable_type: "DefinedWord", voteable_id: params["defined_word_id"], upvote: false).exists?
            # create it
            Vote.create(user: current_user, voteable_id: params["defined_word_id"], voteable_type: "DefinedWord", value: 1, upvote: false)
            # delete the downvote on the word from that user if it exists
            if upvote = Vote.find_by(user: current_user, voteable_id: params["defined_word_id"], voteable_type: "DefinedWord", upvote: true)
              upvote.delete
            end
          end
        end
        @downvotes_count = @word.votes.where(upvote: false).pluck(:value).reduce(:+)
        @upvotes_count = @word.votes.where(upvote: true).pluck(:value).reduce(:+)
      elsif params["comment_id"]
        # voting on comments for the future
      end
      respond_to do |f|
        f.html { redirect_back(fallback_location: root_path) }
        f.js { }
      end
    end
  end # end of def create
end # end of controller