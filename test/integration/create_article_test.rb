require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
   
   def setup
        @user = User.create(username: "Admin", email: "Admin@admin.com", password: "password", admin: true)
        @article = Article.create(title: "test article", description: "description")
   end
   
   
   test "successful creation of article" do
        sign_in_as(@user, "password")
        get new_article_path
        assert_template 'articles/new'
        assert_difference 'Article.count', 1 do 
            post articles_path, article: {title: "test article", description: "description"}
        end
        assert_response :redirect
        follow_redirect!
        assert_response :success
        assert_template 'articles/index'
        assert_match "test article", response.body
   end
   
   
   
    
end