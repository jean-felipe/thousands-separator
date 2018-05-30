require 'spec_helper'
require './thousands_separator_reg_exp'

RSpec.describe ThousandsSeparatorRegExp do
  describe '#format' do
    shared_examples 'number by regex' do
      it 'formats the number by regex' do
        expect(subject.format(number)).to eq(expectation)
      end
    end

    context 'when a big number' do
      let(:number) { 25065460 }
      let(:expectation) { '25,065,460' }
      it_behaves_like 'number by regex'
    end

    context 'when a simple number' do
      let(:number) { 1200 }
      let(:expectation) { '1,200' }
      it_behaves_like 'number by regex'
    end

    context 'when a decimal number' do
      let(:number) { 20 }
      let(:expectation) { '20'}
      it_behaves_like 'number by regex'
    end
  end
end
