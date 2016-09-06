class User < ActiveRecord::Base
    has_many :boards, :dependent => :destroy
    has_many :replies, :through => :boards
   
end
 
