# Synchro_Drive_CyPR

## AN�?LISIS CINEM�?TICO
   1. * Obtener el modelo cinemático correspondiente al robot asignado y expresarlo en su
    forma Jacobiana. [Done]

NOTA: Para simular el robot introducir saturaciones en las actuaciones de la forma
que considere realista.

   2. * Empleando el modelo cinemático directo, obtener las trayectorias de lazo abierto
    del robot con velocidad constante (v o wt) y una actuación oscilatoria senoidal en la
    variable de dirección (w o w?=Asen(w t) para los robot a b. [Done]

   3. * Empleando el modelo cinemático inverso (Jacobiana inversa), obtener las señales
    de control necesarias para que el robot describa una trayectoria parabólica genérica
    (Por ejemplo y=-x*(x-A)). [Done]

NOTA: Los parámetros A y w sugeridos, puede tomarlos a su conveniencia para
obtener trayectorias representativas de los apartados propuestos.
Así mismo cualquier otro parámetro que no esté indicado a su conveniencia y
justifíquelo.


## CONTROL DEL ROBOT

   1. * Completar el modelo cinemático con dinámica básica de los actuadores. Así mismo
      contemplar las saturaciones en los mismos tanto en velocidad como aceleración.
      Con todo ello disponer un bloque RobotMovil que tenga las salidas y entradas bien
      definidas.

   2. * Programe los algoritmos de control a un punto, a una línea, una trayectoria y a una
      postura para su robot, y muestre simulaciones de su comportamiento.
      Muestre los resultados de simulación que considere oportunos para poner de
      manifiesto de forma comparada las propiedades de cada estrategia de control.

   3. * Diseñe una ley de control mediante el algoritmo de Persecución Pura para su robot,
      de modo que siga una trayectoria senoidal del tipo:
      X=A*t ,
      Y= B*sen(w t)
      Puede tomar los parámetros A, B, y w a su conveniencia para obtener un
      comportamiento apropiado para su algoritmo.
