class ThermalClassRules < Rules
  def results
    case @country_code
    when "LU"
      send "results_for_#{@country_code.downcase}"
    else
      raise "#{country_code} not supported"
    end
  end

  def results_for_lu
    return "A" if @value <= 22
    return "B" if @value <= 43
    return "C" if @value <= 69
    return "D" if @value <= 86
    return "E" if @value <= 130
    return "F" if @value <= 170
    return "G" if @value <= 230
    return "H" if @value <= 295
    return "I"
  end
end
