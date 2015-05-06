class ResidenceReportPdf < Prawn::Document
  def initialize(residence_report, view)
    super(top_margin: 70)
    @residence_report = residence_report
    @view = view
    define_grid(:columns => 5, :rows => 8, :gutter => 10)

    grid([0,0], [0,2]).bounding_box do
      client
    end

    grid([4,5], [3,4]).bounding_box do
      results
    end

    grid([1,0], [2,5]).bounding_box do
      variables
    end
  end

  def order_number
    text "Rapport \##{@residence_report.id}", size: 30, style: :bold
  end

  def client
    text "#{@residence_report.client.fullname}", size: 16, style: :bold
    text "#{@residence_report.address}", size: 14
    text "#{@residence_report.zipcode} #{@residence_report.city}", size: 14
    text "#{@residence_report.country_code}", size: 14
  end

  def variables
    text "#{I18n.t('unit', scope: 'simple_form.labels.residence_report')} : #{@residence_report.unit}"
    text "#{I18n.t('construction_year', scope: 'simple_form.labels.residence_report')} : #{@residence_report.construction_year}"
    text "#{I18n.t('energy_performance', scope: 'simple_form.labels.residence_report')} : #{@residence_report.energy_performance}"
    text "#{I18n.t('thermal_insulation', scope: 'simple_form.labels.residence_report')} : #{@residence_report.thermal_insulation}"
  end

  def results
    draw_square(@residence_report.energy_class, 0, 450, 50)
    draw_square(@residence_report.thermal_class, 55, 450, 50)
  end

  def draw_square(value, x, y, square_size = 100)
    stroke_color color_for(value)
    fill_color color_for(value)
    fill_and_stroke_rectangle [x, y], square_size, square_size
    fill_color "00000"
    text_box "#{value.upcase}", :size => square_size*0.8, :at => [x+(square_size*0.2), y-(square_size*0.2)]
  end

  def color_for(value)
    case value.downcase
    when 'a'
      "28622F"
    when 'b'
      "478A3D"
    when 'c'
      "829C45"
    when 'd'
      "DFCE58"
    when 'e'
      "FFE361"
    when 'f'
      "F7A156"
    when 'g'
      "FE5F38"
    when 'h'
      "EA3230"
    when 'i'
      "B41C29"
    end
  end

  # def line_items
  #   move_down 20
  #   table line_item_rows do
  #     row(0).font_style = :bold
  #     columns(1..3).align = :right
  #     self.row_colors = ["DDDDDD", "FFFFFF"]
  #     self.header = true
  #   end
  # end

  # def line_item_rows
  #   [["Product", "Qty", "Unit Price", "Full Price"]] +
  #   @order.line_items.map do |item|
  #     [item.name, item.quantity, price(item.unit_price), price(item.full_price)]
  #   end
  # end

  # def price(num)
  #   @view.number_to_currency(num)
  # end

  # def total_price
  #   move_down 15
  #   text "Total Price: #{price(@order.total_price)}", size: 16, style: :bold
  # end
end
