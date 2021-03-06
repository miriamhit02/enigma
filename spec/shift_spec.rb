require './lib/shift'
require 'pry'

RSpec.describe Shift do
  it 'exists' do
    shift = Shift.new("01234", "040321")

    expect(shift).to be_a(Shift)
  end

  it 'can assign shift to key' do
    shift = Shift.new("01234", "040321")

    expected = {"A" => 01, "B" => 12, "C" => 23, "D" => 34}

    expect(shift.shift_assignment).to eq(expected)
  end

  it 'can create the offset code' do
    shift = Shift.new("01234", "040321")

    # expected1 = {"A" => 3, "B" => 0, "C" => 4, "D" => 1}

    # expect(shift.offset).to eq(expected1)

    expected2 = {"A" => 4, "B" => 12, "C" => 27, "D" => 35}

    expect(shift.shift).to eq(expected2)
  end

end
