# Synchro_Drive_CyPR

## AN�LISIS CINEM�TICO
   1. * Obtener el modelo cinem�tico correspondiente al robot asignado y expresarlo en su
    forma Jacobiana.

NOTA: Para simular el robot introducir saturaciones en las actuaciones de la forma
que considere realista.

   2. * Empleando el modelo cinem�tico directo, obtener las trayectorias de lazo abierto
    del robot con velocidad constante (v o wt) y una actuaci�n oscilatoria senoidal en la
    variable de direcci�n (w o w?=Asen(w t) para los robot a b.

   3. * Empleando el modelo cinem�tico inverso (Jacobiana inversa), obtener las se�ales
    de control necesarias para que el robot describa una trayectoria parab�lica gen�rica
    (Por ejemplo y=-x*(x-A)).

NOTA: Los par�metros A y w sugeridos, puede tomarlos a su conveniencia para
obtener trayectorias representativas de los apartados propuestos.
As� mismo cualquier otro par�metro que no est� indicado a su conveniencia y
justif�quelo.


## CONTROL DEL ROBOT

   1. * Completar el modelo cinem�tico con din�mica b�sica de los actuadores. As� mismo
      contemplar las saturaciones en los mismos tanto en velocidad como aceleraci�n.
      Con todo ello disponer un bloque RobotMovil que tenga las salidas y entradas bien
      definidas.

   2. * Programe los algoritmos de control a un punto, a una l�nea, una trayectoria y a una
      postura para su robot, y muestre simulaciones de su comportamiento.
      Muestre los resultados de simulaci�n que considere oportunos para poner de
      manifiesto de forma comparada las propiedades de cada estrategia de control.

   3. * Dise�e una ley de control mediante el algoritmo de Persecuci�n Pura para su robot,
      de modo que siga una trayectoria senoidal del tipo:
      X=A*t
      Y= B*sen(w t)
      Puede tomar los par�metros A, B, y w a su conveniencia para obtener un
      comportamiento apropiado para su algoritmo.
