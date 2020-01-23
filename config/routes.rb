Rails.application.routes.draw do
	root 'postcodes#show'
	get 'show', to: 'postcodes#show', as: :show
end
