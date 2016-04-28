module Seo
  module ActInstanceMacro
    def create_seo
      Seo::Model.model(self.class).pluck(:action).each do |action|
        self.seo_records.create(action: action) unless self.seo_records.action(action).exists?
      end
      self.seo_records
    end
  end
end