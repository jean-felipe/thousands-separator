class ThousandsSeparator
  def format(number)
    return false if number < 0
    number.digits.each_slice(3).map(&:join).join(',').reverse
  end
end
