json.array! @collection do |microcuenca|
  json.extract! microcuenca,
                :id,
                :nombre
  json.data [
    {key: 'vertiente', value: microcuenca.subcuenca.try(:cuenca).try(:vertiente).try(:nombre)},
    {key: 'ubicacion', value: "#{microcuenca.subcuenca.try(:cuenca).try(:nombre)}, #{microcuenca.subcuenca.try(:nombre)}"}
  ]
end
