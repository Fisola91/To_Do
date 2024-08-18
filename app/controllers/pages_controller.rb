class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

    def home
      redirect_to tasks_path if current_user
    end
end
