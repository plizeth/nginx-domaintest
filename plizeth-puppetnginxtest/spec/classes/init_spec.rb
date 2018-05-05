require 'spec_helper'
describe 'puppetnginxtest' do

  context 'with defaults for all parameters' do
    it { should contain_class('puppetnginxtest') }
  end
end
