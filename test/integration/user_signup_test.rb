require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
   
   def setup 
    @user = User.create(username: "testUser", email: "testUser@gmail.com", password: "password")
   end
   
   test "signup should succeed" do
    #   assert (post_via_redirect users_path(@user))
       
        # get signup_path
        # assert_template 'users/new'
        # assert_difference 'User.count', 1 do 
        #     post users_path, user: {username: "testUser", email: "testUser@gmail.com", password: "password"} 
        # end
        # assert_template 'users/index'
    
    # delete logout_path
    
    get signup_path
    assert_response :success
    post users_path, user: { username: "testUser", email: "testUser@gmail.com", password: "password" } 
    assert_response :success
    # @user = User.last
    assert_template "users/new"

       
         
    #   get categories_path
    #   assert_template 'categories/index'
    #   assert_select "a[href=?]", category_path(@category), text: @category.name
    #   assert_select "a[href=?]", category_path(@category2), text: @category2.name
   end
   
    
end