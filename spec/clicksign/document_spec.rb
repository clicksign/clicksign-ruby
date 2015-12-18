require 'spec_helper'

describe Clicksign::Document do
  include_context 'mock upload'
  include_context 'mock cancel'
  include_context 'mock download'

  let(:client) { Clicksign.client }
  subject(:document) { described_class.create(client, file: 'binary...') }

  it { expect(document).to be_kind_of(described_class) }
  it { expect(document.key).to eq('17') }
  it { expect(document.canceled_at).to be_nil }

  context 'parsing attributes' do
    let(:attributes) do
      {
        key: '17',
        original_name: 'sample.pdf',
        status: 'running',
        created_at: '2015-12-15 19:12:08 -0200',
        list: {
          started_at: '2015-12-15 19:22:08 -0200',
          user_key: '353da45c-a370-11e5-804f-7cd1c3e91b23',
          signatures: [
            { email: 'jane.doe@example.com', act: 'sign' },
            { email: 'john.doe@example.com', act: 'sign' },
            { email: 'john.roe@example.com', act: 'witness' }
          ]
        }
      }
    end

    subject(:document) { described_class.parse(attributes) }

    it { expect(document.key).to eq('17') }
    it { expect(document.name).to eq('sample.pdf') }
    it { expect(document.status).to eq('running') }
    it { expect(document.created_at).to_not be_nil }
    it { expect(document.started_at).to_not be_nil }
    it { expect(document.user_key).to eq('353da45c-a370-11e5-804f-7cd1c3e91b23') }
    it { expect(document.signers.count).to eq(3) }
  end

  context 'canceling' do
    before { document.cancel! }
    it { expect(document.canceled_at).to_not be_nil }
  end

  context 'downloading without background processing' do
    before { document.key = '200' }
    it { expect(document.download).to be_kind_of(String) }
  end

  context 'downloading with background processing' do
    before { document.key = '201' }
    it { expect(document.download).to be_kind_of(String) }
  end

  context 'downloading with timeout' do
    before { document.key = '404' }
    it { expect { document.download }.to raise_error }
  end

  context 'downloading with fail' do
    before { document.key = '500' }
    it { expect { document.download }.to raise_error }
  end
end
