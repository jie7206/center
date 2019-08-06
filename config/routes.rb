ActionController::Routing::Routes.draw do |map|

  map.resources :books, :collection => { :set_default_then_read => :get }
  map.resources :life_goals, :collection => { :destroy_all_life_todos => :get, :destroy_all_life_goals => :get, :reset_life_goals => :get, :todo_list => :get, :completed_todo_list => :get, :unshow_all_life_goals => :get }
  map.resources :param_changes, :collection => { :index => :get, :destroy => :get }
  map.resources :asset_item_detail_catalogs
  map.resources :asset_item_details
  map.resources :donations
  map.resources :member_reports, :collection => { :auto_create => :get, :month_report => :get }
  map.resources :life_catalogs
  map.resources :life_records, :collection => { :switch_goal_minutes_mode => :get, :index => :get, :force_complete_today => :get, :xml_list => :get, :update_all_rec_date => :get }
  map.resources :life_items, :collection => { :cancel_all_is_goal => :get, :update_all_is_not_chart => :get, :update_all_total_minutes => :get, :xml_list => :get }
  map.resources :asset_items, :collection => { :xml_list => :get }
  map.resources :assets
  map.resources :steps, :collection => { :reset_table => :get }
  map.resources :pay_logs
  map.resources :accounts, :collection => { :edit_password => :get, :update_password => :put }
  map.resources :questions
  map.resources :activities, :collection => { :plan_list => :get, :plan_chart => :get }
  map.resources :params, :collection => { :update_exchange_rates_from_api => :get }
  map.resources :histories, :collection => { :auto_delete_empty_title_records => :get, :index_for_today => :get, :update_ctypes => :get, :auto_update_member_id => :get, :index_for_member => :get, :chart_index_by_peroid_and_type => :get, :chart_teacher_history_list => :get, :chart_index_by_month_peroid => :get, :index_by_peroid_and_type => :get, :index_by_month_peroid => :get, :index_for_class_type_in_this_month => :get, :index_for_class_type => :get, :auto_update_class_type => :get, :auto_create => :get, :chart_member_history_list => :get, :member_history_list => :get, :teacher_history_list => :get, :rename => :get }
  map.resources :courses, :collection => { :update_week_schedule_html => :put, :week_schedule_edit => :get, :week_schedule => :get, :destroy_all_courses => :get }
  map.resources :traces, :collection => { :auto_change_to_family => :get, :appointment => :get }
  map.resources :members, :collection => { :index_core => :get, :career_change_to_QunZhong => :get, :simple_index => :get, :family_report => :get, :redirect_to_index => :get, :member_report => :get, :auto_set_admin_only => :get, :delete_select_members => :get, :auto_update_sex_id => :get, :update_QunZhong_value => :get, :all_area_change_to_BeiJing => :get, :area_change_to_BeiJing => :get, :career_change_to_family => :get, :auto_change_to_QunZhong => :get, :pray_list => :get, :xml_list => :get, :index_simple => :get, :update_work_turn_html => :put, :work_turn_edit => :get, :select_status => :get, :select_steps => :get, :select_next_steps => :get, :select_all_pass_steps => :get, :select_children => :get, :picture_list => :get, :conductor_list => :get, :work_turn_list => :get, :update_conductor_id => :get, :update_introducer_id => :get, :update_null_introducer_id_to_0 => :get, :clear_all_step_ids => :get   }
  map.resources :sim_characters

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  #map.root :controller => "main", :action => "life_chart"
  #map.root :controller => 'members', :aid => '2', :cid => 'local_all', :order_desc => 1, :order_method => 'donation_month_ave'
  #map.root :controller => 'members', :action => "pray_list"
  map.root :controller => 'asset_items'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
