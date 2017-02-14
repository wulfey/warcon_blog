class User < ActiveRecord::Base

    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25}
    
    
    # valid email regex
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    # alternate: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    # email must be present and unique
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 105},
     format: { with: VALID_EMAIL_REGEX }
    
    # validate email format using regex
    # validates :email, format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/, message: "Must be good email format." }
    # /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/
    
    
    #   validates :title, presence: true, length: {minimum: 3, maximum: 50}
    #   validates :description, presence: true, length: {minimum: 10, maximum: 1000}


end