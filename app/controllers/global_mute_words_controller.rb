class GlobalMuteWordsController < ApplicationController
	include Authorization

	layout 'admin'

	before_action :set_body_classes

	def index
		@global_mute_words = GlobalMuteWord.all
	end

	def new
		@global_mute_word = GlobalMuteWord.new
	end

	def create
		@global_mute_word = GlobalMuteWord.new(resource_params)
		if @global_mute_word.save
			flash[:success] = "New mute word got saved!"
			redirect_to global_mute_words_path
		else
			flash[:fail] = "Creating the mute word FAILED!"
			render action: :new
		end
	end

	def destroy
		@global_mute_word = GlobalMuteWord.find(params[:id])
		@global_mute_word.destroy
		redirect_to global_mute_words_path
	end

	private

	def resource_params
		params.require(:global_mute_word).permit(:phrase)
	end

	def set_body_classes
		@body_classes = 'admin'
	end
end
