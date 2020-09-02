class DefaultController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def search
    # Create search expression
    @search_query = params[:q]
    search_expression = convert_to_search_expression @search_query

    # Create search data
    search_data = {}
    search_args = params[:search_type]
    @search_type = search_raw_data = search_args.to_s.split(',')
    search_raw_data.each do |raw_data|
      data = raw_data.split(':').map{|v| v.strip}
      key = data[0]
      value = (data.length < 2) ? nil : data[1]
      search_data[key] = value
    end

    # Get search entities
    search_types = search_data.keys

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
    @search_results = Hash[@search_entities.collect{|e| [e.name, e.search(search_expression, {parent: search_data[e.name]}).page(params["page_#{e.name.downcase}"])]}]
  end
end
