(define (problem ejercicio7)
(:domain ejercicio7)
(:objects
    loc1_1 loc1_2 loc1_3 loc1_4 loc1_5
    loc2_1 loc2_2 loc2_3 loc2_4 loc2_5
    loc3_1 loc3_2 loc3_3 loc3_4 loc3_5
    loc4_1 loc4_2 loc4_3 loc4_4 loc4_5
    loc5_1 loc5_2 loc5_3 loc5_4 loc5_5 - localizacion
    CentroDeMando1 Barracones1 Extractor1 Extractor2 BahiaDeIngenieria1 
    Deposito1 Deposito2 Deposito3 - edificio
    VCE1 U1 U2 U3 U4 U5 U6 U7 U8 U9 U10 - unidad
    Minerales1 Minerales2 Minerales3 Gas1 Gas2 - recurso
)

(:init
    (en VCE1 loc2_2)
    (construido CentroDeMando1 loc2_2)
    (nodo Minerales1 loc1_4)
    (nodo Minerales2 loc3_5)
    (nodo Minerales3 loc5_3)
    (nodo Gas1 loc1_1)
    (nodo Gas2 loc5_5)
    
    (edificioTipo CentroDeMando1 centro_de_mando)    
    (edificioTipo Barracones1 barracones)
    (edificioTipo Extractor1 extractor)
    (edificioTipo Extractor2 extractor)
    (edificioTipo BahiaDeIngenieria1 bahia_de_ingenieria)
    (edificioTipo Deposito1 deposito)
    (edificioTipo Deposito2 deposito)
    (edificioTipo Deposito3 deposito)
    (unidadTipo VCE1 vce)
    (recursoTipo Minerales1 minerales)
    (recursoTipo Minerales2 minerales)
    (recursoTipo Minerales3 minerales)
    (recursoTipo Gas1 gas)
    (recursoTipo Gas2 gas)

    (= (limite) 100)

    (= (tiempo) 0)

    (= (consumeEdif centro_de_mando) 100)
    (= (consumeEdif barracones) 46)
    (= (consumeEdif extractor) 21)
    (= (consumeEdif bahia_de_ingenieria) 25)
    (= (consumeEdif deposito) 21)
    (= (consumeUni vce) 12)
    (= (consumeUni marine) 18)
    (= (consumeUni segador) 32)
    (= (consumeInv impulsor_segador) 120)

    (= (consumeDist) 2)
    (= (velocidad vce) 1)
    (= (velocidad marine) 1)
    (= (velocidad segador) 2)

    (= (tenemos minerales) 0)
    (= (tenemos gas) 0)

    (= (extrayendo minerales) 0)
    (= (extrayendo gas) 0)

    (= (requiere centro_de_mando minerales) 150)
    (= (requiere centro_de_mando gas) 50)
    (= (requiere barracones minerales) 150)
    (= (requiere barracones gas) 0)
    (= (requiere extractor minerales) 75)
    (= (requiere extractor gas) 0)
    (= (requiere bahia_de_ingenieria minerales) 125)
    (= (requiere bahia_de_ingenieria gas) 0)
    (= (requiere deposito minerales) 75)
    (= (requiere deposito gas) 25)

    (genera centro_de_mando vce)
    (genera barracones marine)
    (genera barracones segador)
    
    (= (necesita vce minerales) 50)
    (= (necesita vce gas) 0)
    (= (necesita marine minerales) 50)
    (= (necesita marine gas) 0)
    (= (necesita segador minerales) 50)
    (= (necesita segador gas) 50)

    (= (ingrediente impulsor_segador minerales) 50)
    (= (ingrediente impulsor_segador gas) 200)

    (conectado loc1_1 loc2_1)
    (conectado loc2_1 loc1_1)
    (conectado loc1_1 loc1_2)
    (conectado loc1_2 loc1_1)
    (conectado loc1_2 loc2_2)
    (conectado loc2_2 loc1_2)
    (conectado loc1_2 loc1_3)
    (conectado loc1_3 loc1_2)
    (conectado loc1_2 loc1_1)
    (conectado loc1_1 loc1_2)
    (conectado loc1_3 loc2_3)
    (conectado loc2_3 loc1_3)
    (conectado loc1_3 loc1_4)
    (conectado loc1_4 loc1_3)
    (conectado loc1_3 loc1_2)
    (conectado loc1_2 loc1_3)
    (conectado loc1_4 loc2_4)
    (conectado loc2_4 loc1_4)
    (conectado loc1_4 loc1_5)
    (conectado loc1_5 loc1_4)
    (conectado loc1_4 loc1_3)
    (conectado loc1_3 loc1_4)
    (conectado loc1_5 loc2_5)
    (conectado loc2_5 loc1_5)
    (conectado loc1_5 loc1_4)
    (conectado loc1_4 loc1_5)
    (conectado loc2_1 loc1_1)
    (conectado loc1_1 loc2_1)
    (conectado loc2_1 loc3_1)
    (conectado loc3_1 loc2_1)
    (conectado loc2_1 loc2_2)
    (conectado loc2_2 loc2_1)
    (conectado loc2_2 loc1_2)
    (conectado loc1_2 loc2_2)
    (conectado loc2_2 loc3_2)
    (conectado loc3_2 loc2_2)
    (conectado loc2_2 loc2_3)
    (conectado loc2_3 loc2_2)
    (conectado loc2_2 loc2_1)
    (conectado loc2_1 loc2_2)
    (conectado loc2_3 loc1_3)
    (conectado loc1_3 loc2_3)
    (conectado loc2_3 loc3_3)
    (conectado loc3_3 loc2_3)
    (conectado loc2_3 loc2_4)
    (conectado loc2_4 loc2_3)
    (conectado loc2_3 loc2_2)
    (conectado loc2_2 loc2_3)
    (conectado loc2_4 loc1_4)
    (conectado loc1_4 loc2_4)
    (conectado loc2_4 loc3_4)
    (conectado loc3_4 loc2_4)
    (conectado loc2_4 loc2_5)
    (conectado loc2_5 loc2_4)
    (conectado loc2_4 loc2_3)
    (conectado loc2_3 loc2_4)
    (conectado loc2_5 loc1_5)
    (conectado loc1_5 loc2_5)
    (conectado loc2_5 loc3_5)
    (conectado loc3_5 loc2_5)
    (conectado loc2_5 loc2_4)
    (conectado loc2_4 loc2_5)
    (conectado loc3_1 loc2_1)
    (conectado loc2_1 loc3_1)
    (conectado loc3_1 loc4_1)
    (conectado loc4_1 loc3_1)
    (conectado loc3_1 loc3_2)
    (conectado loc3_2 loc3_1)
    (conectado loc3_2 loc2_2)
    (conectado loc2_2 loc3_2)
    (conectado loc3_2 loc4_2)
    (conectado loc4_2 loc3_2)
    (conectado loc3_2 loc3_3)
    (conectado loc3_3 loc3_2)
    (conectado loc3_2 loc3_1)
    (conectado loc3_1 loc3_2)
    (conectado loc3_3 loc2_3)
    (conectado loc2_3 loc3_3)
    (conectado loc3_3 loc4_3)
    (conectado loc4_3 loc3_3)
    (conectado loc3_3 loc3_4)
    (conectado loc3_4 loc3_3)
    (conectado loc3_3 loc3_2)
    (conectado loc3_2 loc3_3)
    (conectado loc3_4 loc2_4)
    (conectado loc2_4 loc3_4)
    (conectado loc3_4 loc4_4)
    (conectado loc4_4 loc3_4)
    (conectado loc3_4 loc3_5)
    (conectado loc3_5 loc3_4)
    (conectado loc3_4 loc3_3)
    (conectado loc3_3 loc3_4)
    (conectado loc3_5 loc2_5)
    (conectado loc2_5 loc3_5)
    (conectado loc3_5 loc4_5)
    (conectado loc4_5 loc3_5)
    (conectado loc3_5 loc3_4)
    (conectado loc3_4 loc3_5)
    (conectado loc4_1 loc3_1)
    (conectado loc3_1 loc4_1)
    (conectado loc4_1 loc5_1)
    (conectado loc5_1 loc4_1)
    (conectado loc4_1 loc4_2)
    (conectado loc4_2 loc4_1)
    (conectado loc4_2 loc3_2)
    (conectado loc3_2 loc4_2)
    (conectado loc4_2 loc5_2)
    (conectado loc5_2 loc4_2)
    (conectado loc4_2 loc4_3)
    (conectado loc4_3 loc4_2)
    (conectado loc4_2 loc4_1)
    (conectado loc4_1 loc4_2)
    (conectado loc4_3 loc3_3)
    (conectado loc3_3 loc4_3)
    (conectado loc4_3 loc5_3)
    (conectado loc5_3 loc4_3)
    (conectado loc4_3 loc4_4)
    (conectado loc4_4 loc4_3)
    (conectado loc4_3 loc4_2)
    (conectado loc4_2 loc4_3)
    (conectado loc4_4 loc3_4)
    (conectado loc3_4 loc4_4)
    (conectado loc4_4 loc5_4)
    (conectado loc5_4 loc4_4)
    (conectado loc4_4 loc4_5)
    (conectado loc4_5 loc4_4)
    (conectado loc4_4 loc4_3)
    (conectado loc4_3 loc4_4)
    (conectado loc4_5 loc3_5)
    (conectado loc3_5 loc4_5)
    (conectado loc4_5 loc5_5)
    (conectado loc5_5 loc4_5)
    (conectado loc4_5 loc4_4)
    (conectado loc4_4 loc4_5)
    (conectado loc5_1 loc4_1)
    (conectado loc4_1 loc5_1)
    (conectado loc5_1 loc5_2)
    (conectado loc5_2 loc5_1)
    (conectado loc5_2 loc4_2)
    (conectado loc4_2 loc5_2)
    (conectado loc5_2 loc5_3)
    (conectado loc5_3 loc5_2)
    (conectado loc5_2 loc5_1)
    (conectado loc5_1 loc5_2)
    (conectado loc5_3 loc4_3)
    (conectado loc4_3 loc5_3)
    (conectado loc5_3 loc5_4)
    (conectado loc5_4 loc5_3)
    (conectado loc5_3 loc5_2)
    (conectado loc5_2 loc5_3)
    (conectado loc5_4 loc4_4)
    (conectado loc4_4 loc5_4)
    (conectado loc5_4 loc5_5)
    (conectado loc5_5 loc5_4)
    (conectado loc5_4 loc5_3)
    (conectado loc5_3 loc5_4)
    (conectado loc5_5 loc4_5)
    (conectado loc4_5 loc5_5)
    (conectado loc5_5 loc5_4)
    (conectado loc5_4 loc5_5)
)

(:goal (and
    (en U1 loc5_4)
    (en U2 loc5_4)
    (en U3 loc5_5)
    (unidadTipo U1 marine)
    (unidadTipo U2 segador)
    (unidadTipo U3 marine)
))

(:metric minimize (tiempo))

)
