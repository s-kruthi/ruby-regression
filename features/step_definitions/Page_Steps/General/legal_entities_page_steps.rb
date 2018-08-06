def CheckLegalEntityEnabled()

  enabled = $daos.get_epms_config_enabled('legalEntityEnable')

  if !enabled.nil?
    expect(enabled[:value]).to eq('1')
  else
    puts COLOR_BLUE + 'Legal Entity is not enabled for this site'
    skip_this_scenario
  end
end

def random_abn()
    weights = [10,1,3,5,7,9,11,13,15,17,19]
    reversed_weights = weights.reverse
    initial_numbers = []
    final_numbers = []
    9.times {initial_numbers << rand(9)+1}
    initial_numbers = [rand(8)+1, rand(7)+2] + initial_numbers
    products = []
    weights.each_with_index do |weight, index|
      products << weight * initial_numbers[index]
    end
    product_sum = products.inject(0){|sum, value| sum + value}
    remainder = product_sum % 89
    if remainder == 0
      final_numbers = initial_numbers
    else
      current_remainder = remainder
      reversed_numbers = initial_numbers.reverse
      reversed_weights.each_with_index do |weight, index|
        next if weight > current_remainder
        if reversed_numbers[index] > 0
          reversed_numbers[index] -= 1
          current_remainder -= weight
          if current_remainder < reversed_weights[index+1]
            redo
          end
        end
      end
      final_numbers = reversed_numbers.reverse
    end
    final_numbers[0] += 1
    final_numbers.join
    return final_numbers.join.to_i
end
