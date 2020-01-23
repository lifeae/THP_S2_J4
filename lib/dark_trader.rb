require 'open-uri'
require 'nokogiri'

def bonjour
  url = "https://coinmarketcap.com/all/views/all/"
  puts "Ce programme va scrapper les données (sigles et valeurs) des cryptomonnaies du site : #{url}"
end

def scrap_symbols
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
  puts "Récupération des symbols des cryptos ..."
  all_cryptos_symbols = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody//tr/td[3]/div') #extrait le symbol de chaque tr
  puts "Fin de la récupération des symbols."
  return all_cryptos_symbols
end

def scrap_prices
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  puts "Récupération des prices des cryptos ..."
  all_cryptos_prices = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody//tr/td[5]/a') #extrait le price de chaque tr
  puts "Fin de la récupération des prices."
  return all_cryptos_prices
end

def symbols_text(all_cryptos_symbols)
  puts "Récupération du texte de chaque symbol et implémentation dans un nouveau tableau"
  all_cryptos_symbols_text = [] #Créer un tableau pour les symbols
  all_cryptos_symbols.each do |crypto_symbol|
    all_cryptos_symbols_text << crypto_symbol.text #permet de récupérer uniquement le texte du symbol et de l'intégrer dans un nouveau tableau
  end
  all_cryptos_symbols_clean = all_cryptos_symbols_text # symbols ok
  return all_cryptos_symbols_clean
end

def prices_text(all_cryptos_prices)
  puts "Récupération du texte et suppression des '$' de chaque price et implémentation dans un nouveau tableau"
  all_cryptos_prices_text = [] #Créer un tableau pour les prices
  all_cryptos_prices.each do |crypto_price|
    all_cryptos_prices_text << crypto_price.text #permet de récupérer uniquement le texte du price et de l'intégrer dans un nouveau tableau
  end
  return all_cryptos_prices_text
end

def prices_without_dollars_tof(all_cryptos_prices_text)
  all_cryptos_prices_text_without_dollars = [] #Créer un tableau pour stocker les prices sans le $
  all_cryptos_prices_text.each do |crypto|
    all_cryptos_prices_text_without_dollars << crypto.delete("$").to_f # permet d'enlever les $ et de passer les prices au format float
  end
  all_cryptos_prices_clean = all_cryptos_prices_text_without_dollars #prices ok
  return all_cryptos_prices_clean
end


def merge(all_cryptos_symbols_clean, all_cryptos_prices_clean)
  puts "Fusion des tableaux symbols et prices"
  hash = Hash[all_cryptos_symbols_clean.zip(all_cryptos_prices_clean)] #Fusioooon
  hash = hash.map {|symbol, crypto| {symbol => crypto}}
  print hash
  puts
end

def perform
  bonjour()
  merge(symbols_text(scrap_symbols),prices_without_dollars_tof(prices_text(scrap_prices)))
end

perform