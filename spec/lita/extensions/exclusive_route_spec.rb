require "spec_helper"

class GottaCatchEmAll < Lita::Handler
  route %r{^Aya\s+Hirano}i, :cute, command: true
  route %r{^Aya\s+Hirano\s+Cute$}i, :indeed, command: true
  route %r{^(.+)$}, :catch_all, command: true, exclusive: true

  def cute(response)
    response.reply('cute')
  end

  def indeed(response)
    response.reply('indeed')
  end

  def catch_all(response)
    response.reply('Puke-mon!')
  end
end

describe GottaCatchEmAll, lita_handler: true do
  before do
    allow(Lita).to receive(:handlers).and_return([described_class])
  end

  it 'trigger cute' do
    send_command('Aya Hirano')
    expect(replies.count).to eq(1)
    expect(replies.last).to eq('cute')
  end

  it 'trigger cute indeed' do
    send_command('Aya Hirano Cute')
    expect(replies.count).to eq(2)
    expect(replies.first).to eq('cute')
    expect(replies.last).to eq('indeed')
  end

  it 'trigger puke' do
    send_command('Aya we lah')
    expect(replies.count).to eq(1)
    expect(replies.first).to eq('Puke-mon!')
  end
end
