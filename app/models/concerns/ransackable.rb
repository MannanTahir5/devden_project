# app/models/concerns/ransackable.rb
module Ransackable
  extend ActiveSupport::Concern
  class_methods do
    def ransackable_attributes(auth_object = nil)
      column_names - %w[id created_at updated_at]
    end

    def ransackable_associations(auth_object = nil)
      reflect_on_all_associations(:belongs_to).map(&:name).map(&:to_s) +
      reflect_on_all_associations(:has_many).map(&:name).map(&:to_s)
    end
  end
end
