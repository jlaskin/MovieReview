class User < ActiveRecord::Base
	has_many :recommendations, :dependent => :destroy
end
