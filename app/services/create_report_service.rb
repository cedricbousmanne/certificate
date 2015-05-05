class CreateReportService
  def initialize(args)
    @args = args
  end

  def method_missing(m, *args, &block)
    method = "#{m.to_s}_builder"
    method.camelcase.constantize.new(@args)
  end
end
