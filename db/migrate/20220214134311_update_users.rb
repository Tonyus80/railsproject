class UpdateUsers < ActiveRecord::Migration[6.1]
  def change
    ##Add Admin user uncomment to add
    #@u = User.find_by(email: 'tony@email.com')
    #@u.update_attribute :admin, true
  end
end
