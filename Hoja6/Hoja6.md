# Inteligencia Artificial
## Hoja 6


### 1. ID3

![ID3](ID3_1.PNG)
![ID3](ID3_2.PNG)

### 2. WEKA
Tutoría.

### 3. SkicitLearn
Tutoría.

### 4. SkicitLearn

Vamos a hacer un recuento global:
    - Aciertos = 448    
    - Fracasos = 247

#### 4.1. Precisión Global

Se puede decir que la precisión global del clasificador es bastante buena, acertando el 65% de las veces.

Una medida global es la Accuracy (tasa de aciertos) = SUM(VP)/SUM(canciones) = 448/700 = 64%

#### 4.2. Subgénero peor identificado

El subgénero peor identificado es el Electro House, puesto que el número de verdaderos positivos no llega ni a la mitad de las veces que se ha probado.
Además, vemos que se confunde bastante con Future House y BigRoom.

#### 4.3. Subgéneros más confundidos

El subgénero más confundido es Future House, ya que ha provocado un número elevado de falsos positivos en tres géneros [15,19,10].

#### 4.4. Interpretación Precisión Exhaustividad
##### 4.4.1. Drum And Bass
Haciendo un recuento observamos:
    - Verdaderos Positivos = 99     
    - Falsos Positivos     = 14     [suma de los DEMÁS de la columna]
    - Falsos Negativos     = 1     [suma de los DEMÁS de la fila]
    - Verdaderos Negativos = 513  
    
Entonces, tenemos que:

Precisión = VP/(VP + FP)     = 99/113 = 87,6%

Exhaustividad = VP/(VP + FN) = 99/100 =  99%

##### 4.4.2. Electro House
Haciendo un recuento observamos:
    - Verdaderos Positivos = 47     [suma de los DEMÁS de la columna]
    - Falsos Positivos     = 37
    - Falsos Negativos     = 53
    - Verdaderos Negativos = 461
    
Entonces, tenemos que:

Precisión = VP/(VP + FP)     = 47/84 =  56%

Exhaustividad = VP/(VP + FN) = 47/100 = 47%
##### 4.4.3. Hip Hop
Haciendo un recuento observamos:
    - Verdaderos Positivos = 51
    - Falsos Positivos     = 42
    - Falsos Negativos     = 49
    - Verdaderos Negativos =
    
Entonces, tenemos que:

Precisión = VP/(VP + FP)     = 51/93 =  54%

Exhaustividad = VP/(VP + FN) = 41/100 = 41%


### 5. Clusters

La indicación para "cortar" un cluster es que haya grupos lo más parecidos posibles en cada cluster.

#### 5.1. Dibujo 1

Yo cortaría en 280 +-, para generar un cluster con {2,5}, que son muy parecidos, y otro con el resto que no se parecen tanto pero sí tienen algo en común.

#### 5.2. Dibujo 2

En este dibujo el corte es trivial: hay que cortar por encima de 2 lo más cerca posible, para generar 3 clusters distintos muy homogéneos entre ellos: {1,4,3,2,8},{5,0,11},{10,7,6,9}.


### 6. Interpretaciones Errores

La Validación Cruzada en n partes consiste en utilizar n veces cada parte como test y todas menos esa como entrenamiento y se saca un error por cada parte.

La idea consiste en observar los elementos del test en esa parte y ver si hay algún caso límite o si el reparto es **razonable**.

La primera está bien porque no hay excesiva diferencia entre el valor mínimo y el valor máximo del error [3.3,3.9].
Sin embargo, en la segunda hay un dato que resalta mucho: la media de los otros cuatro reside en 36,82 y ese dato es de 43.1, significativamente mayor.

Solución: *Cross Validation*.

### 7. Raíz Cuadrada del Error Cuadrático Medio

En esta tabla la clave está en observar en qué método hay mayor diferencia entre el error sobre el conjunto de entrenamiento y sobre el conjunto de datos.

Vemos que hay dos con diferencia mínima:
MLP(0.3) y k-NN(k=8,2).

Para elegir uno de los dos nos quedamos con MLP que tiene menor error.
