class DefaultController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def search
    @search_query = params[:q]
    search_args = params[:search_type]
    search_types = search_args.to_s.split(',').map{|type| type.strip}

    @allowed_entities = [
      Area,
      Cuenca,
      Departamento,
      Facultad,
      Institucion,
      Investigacion,
      Microcuenca,
      Municipio,
      Proyecto,
      Status,
      Subcuenca,
      TipoDocumento,
      Vertiente
    ]
    @search_entities = @allowed_entities
    if !search_args.strip.empty?
      @search_entities = @allowed_entities.select{|e| search_types.include? e.name}
    end
    @search_results = Hash[@search_entities.collect{|e| [e.name, e.search(@search_query).page(params["page_#{e.name.downcase}"])]}]
  end
end
