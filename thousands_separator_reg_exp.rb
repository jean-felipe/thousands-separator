class ThousandsSeparatorRegExp
  def format(n)
    n.to_s.reverse.gsub(/\d{3}(?!\z)/) { |digits| "#{digits}," }.reverse
  end
end
