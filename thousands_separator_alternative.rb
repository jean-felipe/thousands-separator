class ThousandsSeparatorAlternative
  def format(n, sign = ',')
    return 0 if invalid_number?(n)
    n.to_s.gsub(/(\d)(?=(\d{3})*$)(?=(\d))/, "\\1#{sign}")
  end

  private

  def invalid_number?(n)
    n == '' || n.nil? || n == true || n == false
  end
end
