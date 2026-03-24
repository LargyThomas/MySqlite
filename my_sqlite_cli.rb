require "readline"

while buf = Readline.readline(">", true)
  p Readline::HISTORY.to_a
  print(">>> ", buf, "\n")
end


# Faire une boucle qui va tourner au lancement du fichier.
# Le but est de faire une CLI comme fait au dessus.

# Celle ci va écouter jusqu'à ce que l'utilisateur entre une commande dans le "terminal".

# Si il y a une erreur dans le terminal ou que la commande n'est pas une requête SQL qui commence par les préfixes singulier à ce langages on met un message d'erreur pour dire de rentrer un format valide et revenir à "l'écoute".
# Sinon les commandes que le CLI va accepter sont dans le fichiers doc.

# Lorsque la commande est faite on la parse de manière à détecter par quoi la requête commence c'est à dire qu'il y aura 4 types de parsing : SELECT, UPDATE, INSERT, DELETE.

# Lorsque le parsing est fais, donc l'appel du SQL grâce à la requête de l'utilisateur, il nous faudra afficher ce résultat dans le terminal et revenir sur le mode "écoute" donc l'utilisateur peut refaire une saisie.

# Les returns command : pour select tu affiches chaque lignes du tableau qui est retourné par la fonction run de MySqliteQuery on affiche les valeurs séparé par des "|".
#                       pour insert / update / delete affiche message de confirmation que la tâches à été effectué.

# On rajoute la commande quit qui va nous servir à fermer le CLI correctement sans que l'utilisateur ne force le truc en fesant CTRL D dans le terminal.