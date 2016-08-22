class UsersController < ApplicationController
    def signup

        
    end
    
    def create
        user = User.new 
        user.user_email = params[:user_email]
        user.password = params[:password]
        user.nickname = params[:nickname]
        user.kakao = params[:kakao]
        user.school = params[:school]
        user.age = params[:age]
        user.student_number = params[:student_number]
        
        uploader = ProfileUploader.new
        uploader.store!(params[:pic])
        
        user.images = uploader.url
        
        if params[:sex] == '남자'
            user.sex = true
        elsif
            user.sex = false
        end
        user.save
        
        redirect_to '/main/index2'
    end
    
    def log_up_process
        user = User.where(:user_email => params[:email],
                          :password => params[:password]).take
           
        unless user.nil?
            session['user_id']=user.id 
            redirect_to '/board/index'
        else  
            redirect_to '/main/index2'
        
        end 
    
    end
    
    def log_out
        reset_session
        redirect_to '/'
    end
    
        
    def find
        @finduser=User.where('kakao = ? ', params[:kakao]) & User.where('student_number = ?', params[:student_number])

    end

    
    
end
