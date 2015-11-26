ActiveAdmin.register Menu do
  permit_params :email, :name, :parent_id

  before_filter :only => [:show, :edit, :update, :destroy] do
    @menu = Menu.find_by_slug(params[:id])
  end

  index do
    selectable_column
    id_column
    column :name
    column "Child menu", :parent_id
    actions
  end

  filter :name
  filter :ancestry, label: "Main menu", as: :check_boxes, collection: proc { Menu.roots.order(:name)}

  form do |f|
    f.inputs "Menus" do
      f.input :name
      f.input :parent_id, :label => 'Child menu', :as => :select, :collection => Menu.order(:name)
    end
    f.actions
  end

end
