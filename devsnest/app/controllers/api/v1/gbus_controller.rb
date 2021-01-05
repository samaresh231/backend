module Api
    module V1
      class GbusController < JSONAPI::ResourceController

        include JSONAPI::ActsAsResourceController
        before_action :authenticate_user!
        before_action :authorize_member, only: [:update, :delete]
        
        def authorize_member
            return head 403 unless current_user.id == Gbu.find(params[:id]).user_id || current_user.admin?
          end

        def context
          { user: current_user}
        end
  
        def index
            gbus = Gbu.all
            return render json: gbus.to_json
        end

        def show
            gbu = Gbu.find(params[:id])
            return render json: gbu.to_json
        end

        # def showbyuser
        #     user = User.find(params[:id])
        #     return render json: user.gbu.to_json
        # end

        # def create
        #     if canCreateGbu(current_user.id)
        #         gbu = Gbu.create(gbu_params)
        #         gbu.user_id = current_user.id
        #         if gbu.save
        #             render json: gbu.to_json, status: :ok
        #         else
        #             render json: { errors:[
        #                 {
        #                 status: '400',
        #                 title: 'Bad Request',
        #                 detail: "Params not permitted",
        #                 code: '100'
        #             }
        #         ]
        #     }, status: :bad_request
        #         end
        #     else
        #         render json: { errors:[
        #             {
        #             status: '400',
        #             title: 'Bad Request',
        #             detail: "You have already submitted this week's GBU'",
        #             code: '100'
        #         }
        #     ]
        # }, status: :bad_request

        #     end
        # end

        # def update
        #     gbu = Gbu.find(params[:id])
        #     if gbu.update(gbu_params)
        #         render json: gbu.to_json, status: :ok
        #     else
        #         render json: { errors:[
        #             {
        #             status: '400',
        #             title: 'Bad Request',
        #             detail: "Params not permitted",
        #             code: '100'
        #         }
        #     ]
        #     }, status: :bad_request
        #     end
        # end

        # def destroy
        #     gbu = Gbu.find(params[:id])
        #     gbu.destroy
        #     head :ok
        # end

        # def canCreateGbu(user_id)
        #     last_gbu = Gbu.where(user_id: user_id).last
        #     if last_gbu.nil? || findBeginningOfWeek(last_gbu.created_at.to_date)!=findBeginningOfWeek(Date.today)
        #         return true
        #     else
        #         return false
        #     end
        # end

        # def findBeginningOfWeek(date)
        #     if date.wday >= 4 and date.wday <= 6 or date.wday==0
        #         return date.beginning_of_week.to_date+3
        #     else
        #         return date.beginning_of_week.to_date-4
        #     end
        # end
        
        # private

        # def gbu_params
        #     params[:data].require(:attributes).permit(:gbu)
        # end
      end
    end
  end

  