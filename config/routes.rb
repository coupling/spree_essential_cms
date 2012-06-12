class Spree::PossiblePage
  def self.matches?(request)
    non_page_routes = ['admin', 'account', 'cart', 'checkout', 'content', 'login', 'pg/', 'orders', 'products', 's/', 'session', 'signup', 'shipments', 'states', 't/', 'tax_categories', 'user']
    non_page_routes.each{|r| return false if request.path.include?(r)}
    page = Spree::Page.active.find_by_path(request.path) rescue nil
    page.present?
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
  get '*page_path', :to => "pages#show", :as => :page, :constraints => Spree::PossiblePage
end