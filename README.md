NuTyX est une distribution GNU/Linux pour systèmes 32 bits (i686) et 64 bits (x86_64).
Sa construction est basée sur la documentation en ligne disponible sur http://www.linuxfromscratch.org.
L'objectif de NuTyX est de permettre à ses utilisateurs d'être le plus rapidement possible autonomes.
Le nombre de paquets est volontairement limité. Les environnement graphiques sont disponibles dans des projets git séparés.

NuTyX utilise son propre gestionnaire de paquets "cards". Sa particularité: gérer de façon autonome 
les dépendances de fonctionnement. Cela signifie que l'empaqueteur ne doit pas s'en soucier lors de
la création d'un paquet. Dans 99 % des cas, seul les dépendances de compilation suffisent. Comme chaque
paquet est compilé à partir d'un système de base, aucune dépendance superflue ne sera ajoutée lors
de l'installation du binaire.

La syntaxe d'une recette d'un paquet est très proche de celle de la distribution CRUX. Le gestionnaire
de paquet étant au départ le même. 

Sous NuTyX, une collection de paquets / de ports correspond à un ensemble de paquets ou de ports interdépendants.
Par défaut, il y a 3 collections:
- base qui comprend l'ensemble des paquets /ports  qui constituent un système minimal utilisable avec tous les
outils de développement nécessaire.

- console comprend tout les paquets / ports nécessaires au bon fonctionnement d'un système en ligne de commande.

- graphic comprend tout les paquets / ports nécessaires au bon fonctionnement d'un environnement graphique minimaliste.

Ces trois collections fondamentales, dépendent l'une de l'autre dans le sens:

graphic -> console -> base

Sous NuTyX, on parle de "scénario" pour expliquer le choix d'utilisation de cette dernière. On peut très bien
n'utiliser que les binaires proposés dans les trois collections mentionnées ci-dessus, n'utiliser que la collection de
base et ses propres recettes, ou un mélange.
