# frozen_string_literal: true

class Api::V1::GlobalMuteWordsController < Api::BaseController
	before_action -> { doorkeeper_authorize! :read, :'read:global_mute_words' }, only: [:index, :show]
	before_action :require_user!

	respond_to :json

	def index
		@global_mute_words = GlobalMuteWord.all
		render json: @global_mute_words, each_serializer: REST::GlobalMuteWordSerializer
	end

	def show
		@global_mute_word = GlobalMuteWord.find(params[:id])
		render json: @global_mute_word, serializer: REST::GlobalMuteWordSerializer
	end
end
