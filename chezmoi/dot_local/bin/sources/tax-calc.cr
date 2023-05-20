require "option_parser"

DEFAULT_SALES_TAX_RATE = 0.06
DEFAULT_TIP_RATE       = 0.18

salestax = DEFAULT_SALES_TAX_RATE
tip = DEFAULT_TIP_RATE

OptionParser.parse do |parser|
  parser.on("-s VALUE", "--sales-tax=VALUE", "Specifies the sales tax rate") { |value| salestax = value.to_f }
  parser.on("-t VALUE", "--tip=VALUE", "Specifies the tip rate") { |value| tip = value.to_f }
end

FINAL_PRICE = ARGV[0].to_f

pre_tip_price = ARGV.includes?("--no-tip") ? FINAL_PRICE : (FINAL_PRICE / (1 + tip)).round 2, mode: :ties_away
pre_tax_price = (pre_tip_price / (1 + salestax)).round 2, mode: :ties_away

puts "Base: #{pre_tax_price} - Tax: #{(pre_tip_price - pre_tax_price).round 2, mode: :ties_away} - Tip: #{(FINAL_PRICE - pre_tip_price).round 2, mode: :ties_away}"
