require 'spec_helper'
require './thousands_separator'

RSpec.describe ThousandsSeparator do
  describe '#format' do
    describe 'formats the value informed' do
      shared_examples 'format the number' do
        it 'format the number' do
          expect(subject.format(number)).to eq(expectation)
        end
      end

      context 'when a little number' do
        let(:number) { 22 }
        let(:expectation) { '22' }
        it_behaves_like 'format the number'
      end
      
      context 'when a simple number' do
        let(:number) { 1200 }
        let(:expectation) { "1,200" }
        it_behaves_like 'format the number'
      end

      context 'when a big number is used' do
        let(:number) { 300485987 }
        let(:expectation) { '300,485,987' }
        it_behaves_like 'format the number'
      end

      context 'when a negative number is sent' do
        let(:number) { -39500 }
        it 'returns false' do
          expect(subject.format(number)).to be_falsey
        end
      end
    end
  end
end
