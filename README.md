## NuTyX

**ENGLISH** [NuTyX](http://www.nutyx.org) is a GNU/Linux distribution for multiple architectures inspired by the online 
documentation [Linux From Scratch (LFS)](http://www.linuxfromscratch.org).

NuTyX features a custom package manager called "cards". Cards can install binary packages, a set of related binary packages
(e.g. desktop packages, such as KDE or Xfce), and compile source packages from "ports". The distribution is designed
for intermediate and advanced Linux users.

Contributions are welcome. If you don't know what it all about, please take the time to read the documentation at
http://www.nutyx.org/en/build-package.html
(version française)
http://www.nutyx.org/fr/build-package.html

It will explain you what's a collection, a git, a port, the tools around 'cards' etc

Have fun :)

---

**TÜRKÇE** [NuTyX](http://www.nutyx.org) işletim sistemi çoğul mimari desteği sağlayan 
[Linux From Scratch (LFS)](http://www.linuxfromscratch.org) belgelerini baz alan bir GNU/Linux dağıtımıdır. 

NuTyX işletim sistemi "cards" adlı kendine has bir paket yöneticisine sahiptir. Cards ikili paketleri veya ikili paket gruplarını kurabilir ,(örneğin masaüstü XFCE4,KDE gibi) ayrıca ports sisteminden paket derleyebilir.
Sistem orta ve ileri seviye linux kullanıcıları içindir.

---

**DEUTSCH** [NuTyX](http://www.nutyx.org) ist eine GNU/Linux-Distribution für diverse Architekturen basierend auf der
Online-Dokumentation [Linux From Scratch (LFS)](http://www.linuxfromscratch.org).

NuTyX verfügt über einen zentralen Paketmanager "cards". Cards kann Binärpakete, eine Gruppe von verwandten Binärpaketen
installieren (z. B. Desktop-Pakete, wie KDE oder Xfce) und Source-Pakete von "Ports" kompilieren. Die Distribution
ist für mittlere und fortgeschrittene Linux-Benutzer geeignet.

---

**FRANÇAIS** [NuTyX](http://www.nutyx.org) est une distribution GNU/Linux pour systèmes basés sur diverses architectures.
Sa construction est inspirée de la documentation en ligne disponible sur [Linux From Scratch (LFS)](http://www.linuxfromscratch.org).

L'objectif de NuTyX est de permettre à ses utilisateurs d'être le plus rapidement possible autonomes.
Le nombre de paquets est volontairement limité. 

NuTyX utilise son propre gestionnaire de paquets "cards". Cards gère de façon autonome
les dépendances de fonctionnement. Cela signifie que l'empaqueteur ne doit pas s'en soucier lors de
la création d'un paquet. Dans 99 % des cas, seul les dépendances de compilation suffisent. Comme chaque
paquet est compilé à partir d'un système de base, aucune dépendance superflue ne sera ajoutée lors
de l'installation du binaire.

Sous NuTyX, une collection de paquets / de ports correspond à un ensemble de paquets ou de ports interdépendants.

Par défaut, il y a 3 collections:

- base qui comprend l'ensemble des paquets /ports  qui constituent un système minimal utilisable avec tous les
outils de développement nécessaire.

- cli comprend tout les paquets / ports nécessaires au bon fonctionnement d'un système en ligne de commande.

- gui comprend tout les paquets / ports nécessaires au bon fonctionnement d'une interface graphique minimaliste.

Ces trois collections fondamentales, dépendent l'une de l'autre dans le sens:

gui -> cli -> base

Sous NuTyX, on parle de "scénario" pour expliquer le choix d'utilisation de cette dernière. On peut très bien
n'utiliser que les binaires proposés dans les trois collections mentionnées ci-dessus, n'utiliser que la collection de
base et ses propres recettes, ou un mélange.

