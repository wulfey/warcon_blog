class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    
    add_column :users, :password_digest, :string
    # critical column add
    #  creates one way hash digest
    # $2a$10$8cM4pouhjzckoT07FQvZkOtJzJhyVtxj92LZbtUWjxQAjis/ZP1Z2
    
  end
end
