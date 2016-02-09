require 'spec_helper'
describe 'boks' do

  context 'with defaults for all parameters' do
    it { should contain_class('boks') }
  end
end
