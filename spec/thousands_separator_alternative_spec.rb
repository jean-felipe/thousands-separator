require 'spec_helper'
require './thousands_separator_alternative'

RSpec.describe ThousandsSeparatorAlternative do
  describe '#format' do
    shared_examples 'format the number' do
      it 'format the number or return zero' do
        expect(subject.format(number)).to eq(expectation)
      end
    end

    context 'when an nil value' do
      let(:number) { nil }
      let(:expectation) { 0 }
      it_behaves_like 'format the number'
    end

    context 'when an void string' do
      let(:number) { '' }
      let(:expectation) { 0 }
      it_behaves_like 'format the number'
    end

    context 'when a negative number' do
      let(:number) { -12500 }
      let(:expectation) { '-12,500' }
      it_behaves_like 'format the number'
    end

    context 'when a big negative number' do
      let(:number) { -300900700 }
      let(:expectation) { '-300,900,700' }
      it_behaves_like 'format the number'
    end

    context 'when a sign and number' do
      it 'returns the number based on sign' do
        expect(subject.format(1245, '.')).to eq('1.245')
      end
    end

    context 'when a sign and a negative number' do
      it 'returns the number based on sign' do
        expect(subject.format(-250045, '*')).to eq('-250*045')
      end
    end
  end  
end
