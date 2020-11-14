Les objectifs du projet :
Manipulation des tableaux en VHDL
Savoir comment utiliser la fonction séquentielle CASE
Comprendre l’intérêt l’utilisation des process en VHDL
Autres astuces de programmation
Analyse de fonctionnement :
Le circuit Process_LED permet d’effectuer le codage binaire sur 4 bits en BCD 7segments. Les entrées IN1-IN4 permettent de sélectionner un nombre entre ‘0’ et ‘9’ en BCD 7 Segments puis afficher la valeur sur les trois afficheurs 7 segments. Les LED affichent en parallèle l’état des interrupteurs de l’entrée.

La notion du Process en VHDL :
Une analogie directe est d’assimiler un signal à une équipotentielle d’un circuit électronique et comparer un process à un sous-programme d’interruption dont le signal d’interruption est un événement survenu sur l’un des signaux déclarés dans la liste de sensibilité du process. Il existe différentes façons de déclarer un process, la façon la plus proche de l’analogie avec le concept d’interruption est :

–Déclaration de process
Nom du process : process (liste de sensibilité)
Begin
— Corps du process
End process nom du process

La liste de sensibilité est constituée de un ou plusieurs signaux, elle peut être vide mais nous n’envisagerons pas ce cas dans cette introduction. Le corps du process peut contenir des affectations de signaux. Ces signaux, s’ils changent d’état, déclencheront à leur tour l’invocation des process dont ils font partie de la liste de sensibilité. Il est alors primordial d’intégrer la notion de causalité et de cycles de simulation pour comprendre le fonctionnement du mécanisme des process.

L’ordre dans lequel ont été évalués les process à chaque delta-cycle n’a pas d’importance. Une simulation VHDL repose sur le principe de concurrence entre des instructions dites concurrentes tels que les process, elles sont concurrentes car elles sont toutes évaluées à un même delta-cycle.

L’évaluation d’une instruction concurrente à un delta-cycle ne peut pas influencer l’évaluation d’une autre instruction concurrente au même delta-cycle. Leur ordre d’apparition à l’intérieur d’une description VHDL n’a donc aucune importance. Par opposition, l’ordre d’évaluation des instructions séquentielles à l’intérieur d’un process doit respecter leur ordre d’apparition, comme pour un langage classique. A un même delta-cycle, une instruction séquentielle peut modifier des objets utilisés au même delta-cycle dans la suite de la description.

Les valeurs en BCD 7 segments pour un afficheur en anode commune sont stockes dans un tableur de taille 10 [0-9].

Particularités d’un Process en VHDL :
Les différents process d’un programme vhdl s’exécutent en parallèle les uns des autres.

Un processus peut avoir des variables locales. Le fonctionnement du processus est régi par les règles suivantes :
Un processus est une boucle infinie , lorsqu’il arrive à la fin du code, il reprend automatiquement au début
Un processus doit être sensible des points d’arrêt, il existe 2 types de points d’arrêts :
Le processus est associé à une “liste de sensibilité” qui réveille le processus lors d’un changement d’un des signaux.
Le processus a des instructions d’arrêt wait dans sa description interne.
Les variables sont internes au processus et sont affectées immédiatement, contrairement aux signaux qui eux ne sont pas affectés directement mais en fin de processus
Un processus est séquentiel dans le sens ou les instructions sont évaluées l’une après l’autre dans l’ordre d’écriture.
 La fonction CASE en VHDL :
On utilise CASE pour permettre le choix entre plusieurs actions. Cette instruction est très utile dans les machines d’états. En fin de liste, on peut ajouter WHEN OTHERS (WHEN OTHERS => NULL) qui permet de donner une action à tous les choix qui n’ont pu être trouvés dans la liste.

CASE expression IS
WHEN choices => sequence_of_statements;
{WHEN choices => sequence_of_statements;}
END CASE;

Case est une fonction séquentielle, donc il faut l’intégrer dans un Process au contraire de la fonction Select.
