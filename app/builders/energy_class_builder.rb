class EnergyClassBuilder < Builder
  def compute
    @rules.results
  end

  def value
    @report.energy_performance
  end
end
