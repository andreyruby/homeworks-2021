# frozen_string_literal: true

require_relative '../array_refine'

using ArrayRefine

RSpec.describe ArrayRefine, Array do
  subject(:test_array) { [11, 20, 93, 4, -5] }

  describe '#my_map' do
    context 'when calls for each element' do
      it 'returns the original element to a new array' do
        new_array = test_array.my_map { |x| x }
        expect(new_array).to match_array(test_array)
      end

      it 'returns new element to a new array' do
        new_array = test_array.my_map { |x| x + 1 }
        expect(new_array).to match_array([12, 21, 94, 5, -4])
      end

      it 'returns each element to rise to the therd power' do
        new_array = test_array.my_map { |x| x**3 }
        true_array = test_array.map { |x| x**3 }
        expect(new_array).to match_array(true_array)
      end

      it 'save original element' do
        original_array = [11, 20, 93, 4, -5]
        test_array.my_map { |x| x**3 }
        expect(test_array).to match_array(original_array)
      end
    end
  end

  describe '#my_select' do
    context 'when the block\'s condition is true' do
      it 'returns array of positive numbers' do
        expect(test_array.my_select(&:positive?)).to match_array([11, 20, 93, 4])
      end

      it 'returns array of even numbers' do
        expect(test_array.my_select(&:even?)).to match_array([20, 4])
      end

      it 'returns empty array' do
        expect(test_array.my_select { |x| x < -5 }).to be_empty
      end
    end
  end

  describe '#my_each' do
    context 'when calls for each element' do
      it 'returns the original element to a new array' do
        new_array = test_array.my_each { |x| x }
        expect(new_array).to match_array(test_array)
      end

      it 'does not return new elements after operation in the block' do
        new_array = test_array.my_each { |x| x * 0.314 }
        expect(new_array).to match_array(test_array)
      end

      it 'save original elements after operation in the block' do
        original_array = [11, 20, 93, 4, -5]
        expect(original_array.my_each { |x| x**3 }).to match_array(test_array)
      end
    end
  end
end
