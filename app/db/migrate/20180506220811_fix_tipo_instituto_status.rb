class FixTipoInstitutoStatus < ActiveRecord::Migration[5.1]
  def change
    TipoInstituto.all.each do |tipo_instituto|
      return unless tipo_instituto.status.nil?
      active_status = Status.find(Status::VALUES[:active])
      tipo_instituto.status = active_status
      tipo_instituto.save validate: false
    end
  end
end
