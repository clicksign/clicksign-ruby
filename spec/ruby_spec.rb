require 'spec_helper'

describe Ruby do
  it 'has a version number' do
    expect(Ruby::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
