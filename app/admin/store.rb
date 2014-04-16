ActiveAdmin.register Store do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name,:phone,:email,:location
  menu :label => "Stores"
  index do
    column 'Name' do |store|
      link_to store.name, admin_store_path(store)
    end
    column 'Email' do |store|
      link_to store.email, admin_store_path(store)
    end
    column 'Phone' do |store|
      link_to store.phone, admin_store_path(store)
    end
    column 'Location' do |store|
      link_to store.location, admin_store_path(store)
    end
    default_actions
  end
  form :partial => 'form'

end
