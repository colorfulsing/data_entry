class User < ApplicationRecord
  ROLES = [:user, :admin]
  enum role: ROLES
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :set_default_status, :if => :new_record?

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'

  include EmailField

  validates :email, presence: true
  validates :status, presence: true
  validate :at_least_one_admin

  class << self
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query = nil, opts = {}
      results = self.all
      results = results.where("email RLIKE ?", [query]) if !query.blank?
      results.order(:email)
    end

    def entity_label
      "Usuario"
    end

    def role_label role
      return 'Administrador' if role.to_sym == :admin
      return 'Usuario' if role.to_sym == :user
      'Unknown'
    end
  end

  def set_default_role
    self.role ||= :user
  end

  def set_default_status
    self.status ||= Status.find(Status::VALUES[:active])
  end

  def inactive_status?
    self.status.nil? || !self.status.visible?
  end

  def role_label
    User.role_label self.role
  end

  def admin?
    self.role.to_sym == :admin
  end

  def active_for_authentication?
    super && !inactive_status?
  end

  def inactive_message
    if !inactive_status?
      :inactive_status
    else
      super # Use whatever other message
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
    def at_least_one_admin
      return if self.admin? && !self.inactive_status?
      query = User.all
      query = query.left_joins(:status).where('status.visible = ?', 1)
      query = query.where(role: User.roles[:admin])
      query = query.where('users.id <> ?', [self.id]) unless self.id.nil?
      admin_count = query.count
      return if admin_count > 0
      self.errors.add(:role, 'Debe existir al menos un Administrador en el sistema!')
    end
end
