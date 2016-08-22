class BoardController < ApplicationController
    before_action :require_user
    
    def index
        @write = Board.last(4).reverse
        
        
        unless session['user_id'].nil?
            @user = User.find(session['user_id']).images
            @nickname=User.find(session['user_id']).nickname
            @school=User.find(session['user_id']).school
            @age=User.find(session['user_id']).age
            @sex=User.find(session['user_id']).sex
            @kakao=User.find(session['user_id']).kakao
        end
        @myposts = Board.where('user_id = ?', session['user_id'])
        @reply_count = 0
        @apply_count = 0
        @myposts.each do |mypost|
            @reply_count += mypost.replies.count
            @apply_count += mypost.replies.where('apply = ?', true).count
        end
          
        
    end
    
    def create
        write = Board.new
        write.board_title = params[:title]
        write.age = params[:age]
        write.number = params[:number]
        write.board_content = params[:board_content]
        write.needs_team = params[:needs_team]
        write.user_id = session['user_id']
        write.save
        
        redirect_to '/board/index'
    end
    
    def update
        
    end
    
    def delete
        
    end
    
    def write
        
    end
    
    def posts
        @write = Board.find(params[:id])
        unless session['user_id'].nil?
            @nickname=User.find(session['user_id']).nickname
            @school=User.find(session['user_id']).school
            @age=User.find(session['user_id']).age
            @sex=User.find(session['user_id']).sex
        end
        
    end
    
    def mboard
        @write = Board.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
        
   
        unless session['user_id'].nil?
            @nickname=User.find(session['user_id']).nickname
            @school=User.find(session['user_id']).school
            @age=User.find(session['user_id']).age
        end
        
        

    end

    
    def sboard
    #   @result = User.where('sex == ?', true )
        # # @school = User.where('school ==?', )
        @write = Board.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
        user_info = User.all
        if params[:number] != ""
             @write = @write.where('number = ?', params[:number])
        end
        
        if params[:sex] == "1" 
            user_info = user_info.where('sex = ?', true)
        elsif params[:sex] == "2"
            user_info = user_info.where('sex = ?', false)
        end
        
        if params[:school] == "경희대학교"
            user_info = user_info.where('school = ?', params[:school])
        elsif params[:school] == "한국외대"
            user_info = user_info.where('school = ?', params[:school])
        
        end

        user_arr = []
        user_info.each do |info|
            user_arr << info.id
        end
        
        if user_arr.count != 0
            @write = @write.where(user_id: user_arr)
        end
        
        
        unless session['user_id'].nil?
            @nickname=User.find(session['user_id']).nickname
            @school=User.find(session['user_id']).school
            @age=User.find(session['user_id']).age
        end

    
    end
    
    def apply
    
        message = Reply.new
        message.reply_title = params[:message2]
        message.reply = params[:message]
        message.board_id = params[:id_of_posts]
        message.user_id = session['user_id']
        message.save
        
        redirect_to(:back)
        
        
    end
    
    def myposts
        @myposts = Board.where('user_id = ?', session['user_id']).all.order("created_at desc")
    
       
    end
    
    def modify
        @one_board = Board.find(params[:board_id])
        
    end
    
    def destory
        @one_board = Board.find(params[:id])
        @one_board.destroy
        redirect_to "/board/myposts"
    end
    
    def modify2
        @one_board = Board.find(params[:board_id])
        
        @one_board.board_title = params[:title_md]
        @one_board.age = params[:age_md]
        @one_board.number = params[:number_md]
        @one_board.board_content = params[:board_content_md]
        @one_board.needs_team = params[:needs_team_md]
        
        
        @one_board.save
        
        
        redirect_to '/board/myposts'
    
    end  
    
    def message_check
        @myposts = Board.where('user_id = ?', session['user_id']).reverse
       
     
    end 
    
    def destory2
        one_reply = Reply.find(params[:id])
        one_reply.destroy
        redirect_to "/board/message_check"
    end
    
    def check
        one_reply = Reply.find(params[:id])
        one_reply.apply = true
        one_reply.save
        
        redirect_to '/board/message_check'
        
        
    end
    
    def modify_profile
            modifyuser=User.find(session['user_id'])
            
            unless params[:nickname].nil?
                modifyuser.nickname = params[:nickname]
                modifyuser.save
            end
            unless params[:kakao].nil?
                modifyuser.kakao = params[:kakao]
                modifyuser.save
            end
            unless params[:age].nil?
                modifyuser.age = params[:age]
                modifyuser.save
            end

                
        redirect_to '/board/index'
    end
    

end