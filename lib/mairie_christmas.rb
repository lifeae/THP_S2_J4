require 'open-uri'
require 'nokogiri'

page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document

=begin
a = [
  { "ville_1" => "email_1" },
  { "ville_2" => "email_2" }, 
  etc
]

    Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairies). 
    Fais d'abord une méthode get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes
    Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout l'annuaire du Val d'Oise. La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.

Quand tu es assez sûr que chaque méthode marche séparément, tu as juste à imbriquer les deux et à toi la gloire.

Pour les tests, ce sera la même chose que pour l'exercice précédent mais appliqué aux deux méthodes : des tests de fonctionnement de base et des tests de cohérence du résultat.
=end