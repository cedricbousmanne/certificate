class Builder
  def initialize(report)
    @report       = report
    @country_code = report.country_code
    @value        = value
    @rules        = self.class.to_s.gsub(/Builder/, "Rules").constantize.new(@country_code, @value)
    compute
  end

end
