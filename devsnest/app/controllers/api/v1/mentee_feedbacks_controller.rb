class Api::V1::MenteeFeedbacksController < 
    include JSONAPI::ActsAsResourceController
    before_action :authenticate_user!
    before_action :authorize_member, only: [:update, :delete]

    def context
    { user: current_user }
    end

    def authorize_member
        return render_forbidden unless  current_user.id == params[:id].to_i || current_user.normal?
    end
end
