## NuTyX

**ENGLISH** [NuTyX](http://www.nutyx.org) is a GNU/Linux distribution for multiple architectures based on the online 
documentation [Linux From Scratch (LFS)](http://www.linuxfromscratch.org).

NuTyX features a custom package manager called "cards". Cards can install binary packages, a group of related binary packages
(e.g. desktop packages, such as KDE or Xfce), and compile source packages from "ports". The distribution is designed
for intermediate and advanced Linux users.

There are variables defined for script permissions {MODE}, configuration file permissions {CONFMODE}, directory permissions {DIRMODE} and destination directory {DESTDIR}.
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
Sa construction est basée sur la documentation en ligne disponible sur [Linux From Scratch (LFS)](http://www.linuxfromscratch.org).

L'objectif de NuTyX est de permettre à ses utilisateurs d'être le plus rapidement possible autonomes.
Le nombre de paquets est volontairement limité. Les environnement graphiques sont disponibles dans des projets git séparés.

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


**РУССКИЙ** [NuTyX](http://www.nutyx.org) - дистрибутив GNU/Linux-систем на базе различных архитектур.
Его строительство на основе электронной документации доступна на [Linux From Scratch (LFS)](http://www.linuxfromscratch.org).

Цель NuTyX является, чтобы позволить пользователям быть как можно быстрее самостоятельными.
Количество пакетов, добровольно ограничен. Окружающей среды, графики доступны в git-проектов отдельно.

NuTyX использует свой собственный менеджер пакетов "cards". Cards управляет самостоятельно
зависимостей работы. Это означает, что система автосборки не должны беспокоиться при
создание пакета. В 99% случаев, только зависимостей, компиляции, достаточно. Как и каждый
пакет составлен из базовой системы, отсутствие зависимости, лишним не будет добавлен
установка бинарного.

Под NuTyX, коллекция пакетов / портов соответствует набор пакетов или портов взаимосвязаны.
По умолчанию, есть еще 3 коллекции:
- база, который включает в себя набор пакетов /портов, которые представляют собой минимальную систему подходит для всех
инструменты разработки, необходимые.

- консоли включает в себя все пакеты / порты, необходимые для корректной работы системы онлайн-заказа.

- gui включает в себя все пакеты / порты, необходимые для работы графический интерфейс в стиле минимализма.

Эти три основные коллекции, зависят друг от друга в направлении:

gui -> консоли -> база

Под NuTyX, это называется "сценарий", чтобы объяснить выбор использования. Можно очень хорошо
не использовать двоичные файлы представлены в трех коллекциях, упомянутых выше, не использовать, что коллекция
базы и собственных доходов, или их смесь.
