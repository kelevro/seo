module Seo
  module ActMacro

    def add_seo(*args, &block)
      unless self == Seo::Page
        raise ArgumentError unless validate_args(args)

        if args.second.is_a? Array
          args.second.each do |action|
            create_model(args.first, action, args.third) unless exists_model(args.first, action, args.third)
          end
        else
          create_model(args.first, args.second, args.third) unless exists_model(args.first, args.second, args.third)
        end

      end
      has_many :seo_records, class_name: 'Seo::Record', as: :seoable, dependent: :destroy
      accepts_nested_attributes_for :seo_records
      @validation_block = block if block.present?
    end

    def validation_block
      @validation_block
    end


    private

    def create_model(controller, action, param_name)
      clear(controller, action)
      Seo::Model.create!(model:  self.to_s, controller: controller,
                         action: action, param_name: param_name)
    end

    def exists_model(controller, action, param_name)
      Seo::Model.where(model:      self.to_s, controller: controller,
                       param_name: param_name, action: action).exists?
    end

    def validate_args(args)
      return false if args.blank?
      return false if args.count != 3
      true
    end

    def clear(controller, action)
      model = Seo::Model.where(model:      Seo::Page.to_s,
                               controller: controller,
                               action:     action).take
      model.destroy if model.present?
    end
  end
end
