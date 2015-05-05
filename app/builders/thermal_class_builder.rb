class ThermalClassBuilder < Builder
  def compute
    @rules.results
  end

  def value
    @report.thermal_insulation
  end
end
