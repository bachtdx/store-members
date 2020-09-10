class AdministratorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at
end
