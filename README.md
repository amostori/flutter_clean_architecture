Git:

1. `git init`
2. Stwórz plik `.gitignore`
3. `git add .`
4. Aby usunąć plik po git add: `git rm --cache nazwa.pliku`
5. `git commit -m "message"`. Inna wersja `git commit -am "message"` - dodawanie do stage i
   commitowawnie
6. `git checkout -- nazwa.pliku`, usuwa zmiany jak po ctrl+z - Aby to zobaczyć trzeba otworzyć plik
   ponownie.
7. Podobnie działa komenda `git restore nazwa.pliku`
8. Jeśli plik został dodany do stage (`git add`) należy użyć komendy `git reset HEAD nazwa.pliku`,
   aby wyjąć go ze
   stage'a
   i następnie
   komendą `git checkout -- nazwa.pliku` można cofnąć ostatnie zmiany.

Po commit: `git tag -a M2 -m "whatsoever"` by nadać tag bieżącemu commitowi.
Następnie:
`git checkout TAG` by przenieść się do commita. Po pracy przed powrotem do ostatniego
commita usuń wszystkie zmiany z bieżącego: `git reset --hard`.
Aby stagować stare commity:
`git tag -a TAG numer_hasha_commita -m "Tag Message"`
Aby wysłać tagi na Githuba:
`git push --tags`
---
