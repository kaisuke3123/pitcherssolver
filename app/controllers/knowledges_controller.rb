class KnowledgesController < ApplicationController
    def index
        if params[:search] == nil
            @knowledges= Knowledge.all
          elsif params[:search] == ''
            @knowledges= Knowledge.all
          else
            #部分検索
            @knowledges = Knowledge.where("about LIKE ?", "%#{params[:search]}%")
          end
    end

    def new
      @knowledge = Knowledge.new
    end

    def show
        @knowledge = Knowledge.find(params[:id])
      end

    def edit
        @knowledge = Knowledge.find(params[:id])
      end

      def update
        knowledge = Knowledge.find(params[:id])
        if knowledge.update(knowledge_params)
          redirect_to :action => "show", :id => knowledge.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        knowledge = Knowledge.find(params[:id])
        knowledge.destroy
        redirect_to action: :index
      end

    def create
        knowledge = Knowledge.new(knowledge_params)
        knowledge.user_id = current_user.id
        if knowledge.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
        
      end
    
      private
      def knowledge_params
        params.require(:knowledge).permit(:about)
      end
end
 