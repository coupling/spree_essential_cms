class Spree::PossiblePage
  def matches?(request)
    non_page_routes = ['admin', 'account', 'cart', 'checkout', 'content', 'login', 'pg/', 'orders', 'products', 's/', 'session', 'signup', 'shipments', 'states', 't/', 'tax_categories', 'user']
    non_page_routes.each{|r| return false if request.path.include?(r)}
    !Spree::Page.active.find_by_path(request.path).nil?
  end
end

Spree::Core::Engine.routes.draw do
  namespace :admin do

    resources :pages, :constraints => { :id => /.*/ } do
      collection do
        post :update_positions
      end

      resources :contents do
        collection do
          post :update_positions
        end
      end

      resources :images, :controller => "page_images" do
        collection do
          post :update_positions
        end
      end
    end
  end

  resources :pages
  match '*page_path', :to => "pages#show", :as => :page, :constraints => Spree::PossiblePage.new
end