Rails.application.routes.draw do
	root 'postcodes#show'
	get 'check', to: 'postcodes#check', as: :check
end
