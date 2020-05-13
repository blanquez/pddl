(define (domain ejercicio7)

(:requirements :adl :fluents :strips :typing :negative-preconditions :disjunctive-preconditions :universal-preconditions)
(:types
    localizacion recurso unidad edificio - object
)
(:constants
    vce marine segador - tipo_unidad
    centro_de_mando barracones extractor bahia_de_ingenieria deposito - tipo_edificio
    minerales gas - tipo_recurso
    impulsor_segador - investigacion
)
(:functions
    (tiempo)
    (consumeEdif ?te - tipo_edificio)
    (consumeUni ?tu - tipo_unidad)
    (consumeInv ?i - investigacion)
    (consumeDist)
    (velocidad ?tu - tipo_unidad)
    (tenemos ?r - tipo_recurso)
    (extrayendo ?r - tipo_recurso)
    (limite)
    (necesita ?tu - tipo_unidad ?tr - tipo_recurso)
    (requiere ?te - tipo_edificio ?tr - tipo_recurso)
    (ingrediente ?i - investigacion ?tr - tipo_recurso)
)
(:predicates
    (conectado ?x ?y - localizacion)

    (en ?u - unidad ?x - localizacion)
    (ocupado ?v - unidad)

    (construido ?e - edificio ?x - localizacion)
    (genera ?te - tipo_edificio ?tu - tipo_unidad)

    (nodo ?r - recurso ?x - localizacion)

    (edificioTipo ?e - edificio ?t - tipo_edificio)
    (unidadTipo ?u - unidad ?t - tipo_unidad)
    (recursoTipo ?e - recurso ?r - tipo_recurso)

    (investigado ?i - investigacion)
)

(:action navegar
    :parameters (?u - unidad ?tu - tipo_unidad ?x ?y - localizacion)
    :precondition (and
        (en ?u ?x)
        (unidadTipo ?u ?tu)
        (conectado ?x ?y)
        (not (ocupado ?u))
        )
    :effect (and
        (en ?u ?y)
        (not (en ?u ?x))
        (increase (tiempo) (/ (consumeDist) (velocidad ?tu)))
    )
)

(:action asignar
    :parameters (?u - unidad ?r - recurso ?tr - tipo_recurso ?l - localizacion ?e - edificio)
    :precondition (and
        (not (ocupado ?u))
        (unidadTipo ?u vce)
        (nodo ?r ?l)
        (en ?u ?l)
        (recursoTipo ?r ?tr)
        (or (not (recursoTipo ?r gas)) (and (construido ?e ?l) (edificioTipo ?e extractor)))
        )
    :effect (and
        (ocupado ?u)
        (increase (extrayendo ?tr) 1)
    )
)

(:action desasignar
    :parameters (?u - unidad ?r - recurso ?tr - tipo_recurso ?l - localizacion)
    :precondition (and 
        (ocupado ?u)
        (en ?u ?l)
        (nodo ?r ?l)
        (recursoTipo ?r ?tr)
    )
    :effect (and 
        (not (ocupado ?u))
        (decrease (extrayendo ?tr) 1)
    )
)

(:action construir
    :parameters (?u - unidad ?e - edificio ?te - tipo_edificio ?l - localizacion)
    :precondition (and
        (forall (?x - localizacion)(not (construido ?e ?x)))
        (not (ocupado ?u))
        (unidadTipo ?u vce)
        (en ?u ?l)
        (forall (?ea - edificio) (not (construido ?ea ?l)))
        (edificioTipo ?e ?te)
        (forall (?t - tipo_recurso)
            (>= (tenemos ?t) (requiere ?te ?t))
        )
    )
    :effect (and
        (construido ?e ?l)
        (forall (?t - tipo_recurso) 
            (decrease (tenemos ?t) (requiere ?te ?t))
        )
        (increase (tiempo) (consumeEdif ?te))
    )
)

(:action construir_dep
    :parameters (?u - unidad ?e - edificio ?l - localizacion)
    :precondition (and
        (forall (?x - localizacion)(not (construido ?e ?x)))
        (not (ocupado ?u))
        (unidadTipo ?u vce)
        (en ?u ?l)
        (forall (?ea - edificio) (not (construido ?ea ?l)))
        (edificioTipo ?e deposito)
        (forall (?t - tipo_recurso)
            (>= (tenemos ?t) (requiere deposito ?t))
        )
    )
    :effect (and
        (construido ?e ?l)
        (forall (?t - tipo_recurso) 
            (decrease (tenemos ?t) (requiere deposito ?t))
        )
        (increase (limite) 100)
        (increase (tiempo) (consumeEdif deposito))
    )
)

(:action reclutar
    :parameters (?u - unidad ?tu - tipo_unidad ?e - edificio ?te - tipo_edificio ?l - localizacion)
    :precondition (and 
        (construido ?e ?l)
        (edificioTipo ?e ?te)
        (forall (?t - tipo_recurso)
            (>= (tenemos ?t) (necesita ?tu ?t))
        )
        (forall (?x - tipo_unidad)
            (not (unidadTipo ?u ?x))
        )
        (genera ?te ?tu)
        (or (not (= ?tu segador)) (investigado impulsor_segador))
    )
    :effect (and
        (unidadTipo ?u ?tu)
        (en ?u ?l)
        (forall (?t - tipo_recurso)
            (decrease (tenemos ?t) (necesita ?tu ?t))
        )
        (increase (tiempo) (consumeUni ?tu))
    )
)

(:action investigar
    :parameters (?i - investigacion ?e - edificio ?l - localizacion)
    :precondition (and
        (edificioTipo ?e bahia_de_ingenieria)
        (construido ?e ?l)
        (forall (?t - tipo_recurso)
            (>= (tenemos ?t) (ingrediente ?i ?t))
        )
    )
    :effect (and
        (investigado ?i)
        (forall (?t - tipo_recurso)
            (decrease (tenemos ?t) (ingrediente ?i ?t))
        )
        (increase (tiempo) (consumeInv ?i))
    )
)

(:action recolectar
    :parameters ()
    :precondition (and
        (forall (?t - tipo_recurso)
            (not (> (+ (tenemos ?t) (* (extrayendo ?t) 25)) (limite)))
        )
    )
    :effect (and 
        (forall (?t - tipo_recurso)
            (increase (tenemos ?t) (* 25 (extrayendo ?t)))
        )
        (increase (tiempo) 5)
    )
)


)