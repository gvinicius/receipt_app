# frozen_string_literal: true

require 'rspec'
require 'open3'

RSpec.describe 'Runner' do
  def run_runner(input)
    output, _status = Open3.capture2('ruby', 'runner.rb', stdin_data: input)
    output.lines.map(&:chomp).reject { |l| l.start_with?('Enter') }
  end

  it 'produces correct output for input 1' do
    input = <<~INPUT
      2 book at 12.49
      1 music CD at 14.99
      1 chocolate bar at 0.85
    INPUT

    expect(run_runner(input)).to eq([
                                      '2 book at: 24.98',
                                      '1 music CD at: 16.49',
                                      '1 chocolate bar at: 0.85',
                                      'Sales Taxes: 1.50',
                                      'Total: 42.32'
                                    ])
  end

  it 'produces correct output for input 2' do
    input = <<~INPUT
      1 imported box of chocolates at 10.00
      1 imported bottle of perfume at 47.50
    INPUT

    expect(run_runner(input)).to eq([
                                      '1 imported box of chocolates at: 10.50',
                                      '1 imported bottle of perfume at: 54.65',
                                      'Sales Taxes: 7.65',
                                      'Total: 65.15'
                                    ])
  end

  it 'produces correct output for input 3' do
    input = <<~INPUT
      1 imported bottle of perfume at 27.99
      1 bottle of perfume at 18.99
      1 packet of headache pills at 9.75
      3 imported boxes of chocolates at 11.25
    INPUT

    expect(run_runner(input)).to eq([
                                      '1 imported bottle of perfume at: 32.19',
                                      '1 bottle of perfume at: 20.89',
                                      '1 packet of headache pills at: 9.75',
                                      '3 imported boxes of chocolates at: 35.55',
                                      'Sales Taxes: 7.90',
                                      'Total: 98.38'
                                    ])
  end
end
