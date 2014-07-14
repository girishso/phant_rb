require_relative '../lib/phant_rb'

describe PhantRb do
  before do
    @client = PhantRb::Client.new "LQQNXaOx4wUm2Ya4vl08", %w(humidity temp), private_key: 'A11G0mPKy5S4rzNEo0Z6'
  end

  it 'logs data' do
    resp = @client.log(12.0, 23)
    expect(resp.success).to be true
  end

  it 'returns rate limits' do
    resp = @client.log(12.0, 23)
    @client.get
    resp = @client.rate_limits
    expect(resp.has_key?(:x_rate_limit_remaining)).to be true
  end

  it 'reads data' do
    resp = @client.get
    expect(resp).to be_an(Array)
  end

  it 'returns stats for a stream' do
    resp = @client.stats
    expect(resp.has_key?(:remaining)).to be true
  end


  it 'clears a stream' do
    resp = @client.clear
    expect(resp.success).to be true
  end

  it 'completely deletes a stream'
end
