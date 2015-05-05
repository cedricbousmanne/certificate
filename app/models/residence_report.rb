class ResidenceReport < ActiveRecord::Base
  belongs_to :client
  after_initialize :initialize_client_data
  after_create :build_classes

  def initialize_client_data
    self.address      = client.address
    self.zipcode      = client.zipcode
    self.city         = client.city
    self.country_code = client.country_code
  end

  def build_classes
    energy_class  = CreateReportService.new(self).energy_class.compute
    thermal_class = CreateReportService.new(self).thermal_class.compute

    self.update_attributes({
      energy_class: energy_class,
      thermal_class: thermal_class
    })
  end

end
