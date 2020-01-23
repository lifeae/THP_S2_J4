require_relative '../lib/dark_trader'

describe 'La méthode scrap_symbol' do
  it 'Scrapper les symboles' do
    expect(scrap_symbols()).to eq("")
  end
end

describe 'La méthode scrap_prices' do
  it 'Scrapper les prix' do
    expect(scrap_prices()).to eq("")
  end
end

describe 'La méthode symbols_text' do
  it 'Récupérer le texte des symboles scrappés' do
    expect(symbols_text()).to eq("")
  end
end

describe 'La méthode prices_text' do
  it 'Récupérer le texte des prix scrappés' do
    expect(prices_text()).to eq("")
  end
end

describe 'La méthode prices_without_dollars_tof' do
  it 'Supprimer les : $ dans les prix et les passer en float' do
    expect(prices_without_dollars_tof()).to eq("")
  end
end

describe 'La méthode merge' do
  it 'Fusionner les symboles et les prix' do
    expect(merge(,)).to eq("")
  end
end