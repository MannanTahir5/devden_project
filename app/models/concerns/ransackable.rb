module Ransackable
  extend ActiveSupport::Concern

  class_methods do
    def ransackable_attributes(auth_object = nil)
      column_names - %w[id created_at updated_at]
    end

    def ransackable_associations(auth_object = nil)
      reflect_on_all_associations
    end
  end
end
