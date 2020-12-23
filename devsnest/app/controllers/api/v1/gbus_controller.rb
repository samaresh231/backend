module Api
    module V1
      class GbusController < ApplicationController

        include JSONAPI::ActsAsResourceController
        before_action :authenticate_user!
        before_action :authorize_member, only: [:update, :delete]
        
        def context
          { gbu: current_user.gbu }
        end
  
        def authorize_member
          return head 403 unless current_user.id == params[:id].to_i || current_user.admin?
        end

        def show
            gbu = current_user.gbu
            return render json: gbu.to_json
        end

        def index
            gbus = Gbu.all
            return render json: gbus.to_json
        end

        def create
            if canCreateGbu(current_user.id)
                gbu = Gbu.create(create_gbu_params)
                gbu.user_id = current_user.id
                if gbu.save
                    render json: gbu.to_json, status: :ok
                else
                    render json: { errors:[
                        {
                        status: '400',
                        title: 'Bad Request',
                        detail: "Params not permitted",
                        code: '100'
                    }
                ]
            }, status: :bad_request
                end
            else
                render json: { errors:[
                    {
                    status: '400',
                    title: 'Bad Request',
                    detail: "You have already submitted this week's GBU'",
                    code: '100'
                }
            ]
        }, status: :bad_request

            end
        end

        def canCreateGbu(user_id)
            last_gbu = Gbu.where(user_id: user_id).last
            byebug
            puts last_gbu.id
            if last_gbu.nil? || findBeginningOfWeek(last_gbu.created_at.to_date)!=findBeginningOfWeek(Date.today)
                return true
            else
                return false
            end
        end

        def findBeginningOfWeek(date)
            if date.wday >= 4 and date.wday <= 6 or date.wday==0
                return date.beginning_of_week.to_date+3
            else
                return date.beginning_of_week.to_date-4
            end
        end
        
        def create_gbu_params
            params[:data].require(:attributes).permit(:gbu)
        end
      end
    end
  end
  