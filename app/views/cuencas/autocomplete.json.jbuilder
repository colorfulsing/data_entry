json.array! @collection do |cuenca|
  json.extract! cuenca,
                :id,
                :nombre
  json.data [
    {key: 'vertiente', value: cuenca.vertiente.try(:nombre)}
  ]
end
