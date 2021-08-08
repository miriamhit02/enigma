class Offset
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def shift_assignment
    shift_assignment = {
      "A" => @key[0..1].to_i,
      "B" => @key[1..2].to_i,
      "C" => @key[2..3].to_i,
      "D" => @key[3..4].to_i,
    }
  end

  def shift
    date_sqrd = @date.to_i ** 2
    # binding.pry
    last_four = date_sqrd.to_s[-4..-1]
    shift = {
      "A" => last_four[0].to_i,
      "B" => last_four[1].to_i,
      "C" => last_four[2].to_i,
      "D" => last_four[3].to_i
    }

    offset = shift.merge(shift_assignment) do |key, value, other|
      value + other
    end
    offset
  end
end
