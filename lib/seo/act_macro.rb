module Seo
  module ActMacro
    def add_seo(*args, &block)
      unless self == Seo::Page
        raise ArgumentError unless validate_args(args)
        create_model(args) unless exists_model(args)
      end
      has_one :seo, class_name: 'Seo::Record', as: :seoable
      accepts_nested_attributes_for :seo
      init_seo_model
      @validation_block = block if block.present?
    end

    def validation_block
      @validation_block
    end

    private

    def create_model(args)
      Seo::Model.create!(model:  self.to_s, controller: args.first,
                         action: args.second, param_name: args.third)
    end

    def exists_model(args)
      Seo::Model.where(model:  self.to_s, controller: args.first,
                       action: args.second, param_name: args.third).exists?
    end

    def validate_args(args)
      return false if args.blank?
      return false if args.count != 3
      true
    end

    def init_seo_model
      after_initialize do |model|
        if model.seo.blank?
          build_seo
        else
          model.seo
        end
      end
    end
  end
end
