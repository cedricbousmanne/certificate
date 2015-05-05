class EnergyClassRules < Rules
  def results
    case @country_code
    when "LU"
      send "results_for_#{@country_code.downcase}"
    else
      raise "#{country_code} not supported"
    end
  end

  def results_for_lu
    return "A" if @value <= 45
    return "B" if @value <= 95
    return "C" if @value <= 125
    return "D" if @value <= 145
    return "E" if @value <= 210
    return "F" if @value <= 295
    return "G" if @value <= 395
    return "H" if @value <= 530
    return "I"
  end
end
