ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation, :address, :phone, :role, :store_id
  menu :label => "Users"
  index do
    column 'Name' do |user|
      link_to user.name, admin_user_path(user)
    end
    column 'Email' do |user|
      link_to user.email, admin_user_path(user)
    end
    column 'Address' do |user|
      link_to user.address, admin_user_path(user)
    end
    column 'Phone' do |user|
      link_to user.phone, admin_user_path(user)
    end
    column 'Role' do |user|
      link_to user.role, admin_user_path(user)
    end
    column 'Store' do |user|
      link_to user.store_id, admin_user_path(user)
    end
  end
  form :partial => 'form'
  
end
