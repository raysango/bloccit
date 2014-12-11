require 'rails-helper'
describe Vote do
  describe 'validations' do
    before do
      @v=Vote.new(value: 1)
      @v1=Vote.new(value: -1)
      @v2=Vote.new(value: 2)
    end
    describe 'value validation' do
      it "it only allows -1 or 1 as values" do
        expect (@v.valid?).to eq(true)
        expect (@v1.valid?).to eq(true)
        expect (@v2.valid?).to eq(false)
      end
    end
  end
end