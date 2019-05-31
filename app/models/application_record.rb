class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def capitalize_attributes(capitalizable)
    self.attributes.each do |attr,val|
      self.send("#{attr}=", val.to_s.strip.titlecase) if capitalizable.include?(attr)
    end
  end
end
