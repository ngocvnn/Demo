class CommentsController < ApplicationController

	def create	
		@comment = current_user.comments.build(comment_params)
		# binding.pry
		if @comment.save
			flash[:success] = "Comment created!"
			redirect_to @comment.status
		else
			flash[:danger] = "error"
		end
	end

	def destroy
	end
	
	private
	def comment_params
		params.required(:comment).permit(:content,:user_id,:status_id)
	end
end
