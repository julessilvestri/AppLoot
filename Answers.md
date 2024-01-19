Exercice 1 :
Il manque le "self" dans le list, car vu que nous somme en SwiftUi, il a besoin du self pour se mettre à jour lui même.

Exercice 2 :
On utilise un ForEach car on ne peut pas mettre une liste dans une liste.
le foreach permet de parcourir chaque item, d'un tableau et de faire une action à cahque iteration, le bouton est séparer du foreach, car sinon le bouton s'afficherait au de fois que d'itération.

Exercice 3 :
Le code ne marche pas car il manque un @State pour prendre en compte le changemant d'état de la liste.
Il faut utiliser le @State pour déclarer des propriétés dont la modification entraîne une mise à jour de l’interface utilisateur.
Donc une fois que la liste est modifiée, la liste de l'interface est mis à jour.

Exercice 1 :
Lorsque je clique sur le bouton ajouter il ne se passe rien car la liste, n'est pas mis à jour.
J'utilise donc les fonction ObservableObject, @Published et @StateObject
J'utilise @StateObject pour initialiser un objet observable comme propriété de la vue 'ContentView' et garantit que l’objet est créé une seule fois.

Erreur LootItem => LootItem doit être conforme à Hashable. Il faut donc ajouter les conformités Identifiable et Hashable à LootItem pour permettre à SwiftUI de distinguer les instances de l'objet Lookitem.

