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
          if !@word.votes.where(user: current_user, upvote: true).exists?
            # create it
            @word.votes.create(user: current_user, value: 1, upvote: true)
            # delete the downvote on the word from that user if it exists
            if downvote = @word.votes.find_by(user: current_user, upvote: false)
              downvote.delete
            end

            @downvotes_count = @word.votes.where(upvote: false).pluck(:value).reduce(:+)
            @upvotes_count = @word.votes.where(upvote: true).pluck(:value).reduce(:+)

          respond_to do |f|
            f.html { redirect_back(fallback_location: root_path) }
            f.js { render "./votes/create_upvote"}
          end
          end


        elsif params["commit"] == "downvote"
          # if downvote doesnt exist
          if !@word.votes.where(user: current_user, upvote: false).exists?
            # create it
            @word.votes.create(user: current_user, value: 1, upvote: false)
            # delete the downvote on the word from that user if it exists
            if upvote = @word.votes.find_by(user: current_user, upvote: true)
              upvote.delete
            end

            @downvotes_count = @word.votes.where(upvote: false).pluck(:value).reduce(:+)
            @upvotes_count = @word.votes.where(upvote: true).pluck(:value).reduce(:+)

            respond_to do |f|
              f.html { redirect_back(fallback_location: root_path) }
              f.js { render "./votes/create_downvote"}
            end
          end

        end

      elsif params["comment_id"]
        # voting on comments for the future
      end
    end
  end # end of def create
end # end of controller