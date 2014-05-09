ActiveAdmin.register Page do
  controller do
    defaults :finder => :find_by_permalink
  end

  index do
    selectable_column
    column :title do |content|
      content.title.truncate(50).html_safe
    end
    column :permalink
    column :content do |content|
      content.content.truncate(75).html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :permalink
      f.input :content
    end
    f.actions
  end


  show do |page|
    attributes_table do
      row :id
      row :title
      row :permalink
      row :content do
        simple_format page.content
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
  
end
