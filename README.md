# Synchro_Drive_CyPR

## ANALISIS CINEMATICO
   1. * Obtener el modelo cinematico correspondiente al robot asignado y expresarlo en su
    forma Jacobiana.

NOTA: Para simular el robot introducir saturaciones en las actuaciones de la forma
que considere realista.

   2. * Empleando el modelo cinematico directo, obtener las trayectorias de lazo abierto
    del robot con velocidad constante (v o wt) y una actuacion oscilatoria senoidal en la
    variable de direccion w=Asen(w t) para el robot. 

   3. * Empleando el modelo cinematico inverso (Jacobiana inversa), obtener las señales
    de control necesarias para que el robot describa una trayectoria parabolica generica
    (Por ejemplo y=-x*(x-A)).

NOTA: Los parametros A y w sugeridos, puede tomarlos a su conveniencia para
obtener trayectorias representativas de los apartados propuestos.
Asi mismo cualquier otro parÃ¡metro que no estÃ© indicado a su conveniencia y
justifiquelo.


## CONTROL DEL ROBOT

   1. * Completar el modelo cinematico con dinamica basica de los actuadores. Asi mismo
      contemplar las saturaciones en los mismos tanto en velocidad como aceleracion.
      Con todo ello disponer un bloque RobotMovil que tenga las salidas y entradas bien
      definidas.

   2. * Programe los algoritmos de control a un punto, a una linea, una trayectoria y a una
      postura para su robot, y muestre simulaciones de su comportamiento.
      Muestre los resultados de simulacion que considere oportunos para poner de
      manifiesto de forma comparada las propiedades de cada estrategia de control.

   3. * Diseñe una ley de control mediante el algoritmo de Persecucion Pura para su robot,
      de modo que siga una trayectoria senoidal del tipo:
      X=A*t 
      Y= B*sen(w t)
      Puede tomar los parÃ¡metros A, B, y w a su conveniencia para obtener un
      comportamiento apropiado para su algoritmo.
