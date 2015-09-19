class AdminController < ApplicationController
	def show

	end

	def panel
		@admin = current_admin
	end
end
