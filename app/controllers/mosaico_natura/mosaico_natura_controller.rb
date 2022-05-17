class MosaicoNatura::MosaicoNaturaController < ApplicationController
	layout 'mosaico_natura'
	
	protected
	
	def authenticate
		puts 'MNC'
		@juez = nil
		authenticate_mn
	end
end