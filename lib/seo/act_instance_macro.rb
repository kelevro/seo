module Seo
  module ActInstanceMacro
    def hello
      puts 'hell'
      puts self
    end

    def init_seo
      Seo::Model.model(self.class).pluck(:action).each do |action|
        self.seo_records.build(action: action) unless self.seo_records.action(action).exists?
      end
    end
  end
end