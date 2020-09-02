json.array! @collection do |subcuenca|
  json.extract! subcuenca,
                :id,
                :nombre
  json.data [
    {key: 'vertiente', value: subcuenca.cuenca.try(:vertiente).try(:nombre)},
    {key: 'subcuenca', value: subcuenca.cuenca.try(:nombre)}
  ]
end
