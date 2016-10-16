class StateDeclarationsController < ApplicationController

  before_action :logged_in


  def create
    @dec = current_user.build_state_declaration(state_declaration_params)
    if @dec.save
      redirect_to edit_grant_review_path
    else
      redirect_to edit_grant_review_path
    end
  end

  private


    # Never trust parameters from the scary einternet, only allow the white list through.
    def state_declaration_params
      params.require(:state_declaration).permit(:declaration)
    end

    def logged_in
      redirect_to login_path if !signed_in?
    end

end
