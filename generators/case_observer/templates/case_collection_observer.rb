class <%= observer_singular_class %>Observer < ActiveRecord::Observer
  <% unless models.empty? %>
  observe <%= models_singular_sym.join(', ') %>
  <% end %>
  <% for model in models_singular %>
  def before_save_<%= model.pluralize %>(<%= model %>)
  end
  
  def after_save_<%= model.pluralize %>(<%= model %>)
  end
  
  def before_destroy_<%= model.pluralize %>(<%= model %>)
  end
  
  def after_destroy_<%= model.pluralize %>(<%= model %>)
  end
  <% end %>
end