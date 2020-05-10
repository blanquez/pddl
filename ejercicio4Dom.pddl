(define (domain ejercicio4)

(:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
(:types
    localizacion recurso unidad edificio - object
)
(:constants
    vce marine segador - tipo_unidad
    centro_de_mando barracones extractor - tipo_edificio
    minerales gas - tipo_recurso
)
(:predicates
    (conectado ?x ?y - localizacion)

    (en ?u - unidad ?x - localizacion)
    (ocupado ?v - unidad)
    (necesita ?tu - tipo_unidad ?tr - tipo_recurso)

    (construido ?e - edificio ?x - localizacion)
    (requiere ?te - tipo_edificio ?tr - tipo_recurso)
    (genera ?te - tipo_edificio ?tu - tipo_unidad)

    (nodo ?r - recurso ?x - localizacion)
    (tenemos ?r - tipo_recurso)

    (edificioTipo ?e - edificio ?t - tipo_edificio)
    (unidadTipo ?u - unidad ?t - tipo_unidad)
    (recursoTipo ?e - recurso ?r - tipo_recurso)
)

(:action navegar
    :parameters (?u - unidad ?x ?y - localizacion)
    :precondition (and
        (en ?u ?x)
        (conectado ?x ?y)
        )
    :effect (and
        (en ?u ?y)
        (not (en ?u ?x))
    )
)

(:action asignar
    :parameters (?u - unidad ?r - recurso ?tr - tipo_recurso ?l - localizacion ?e - edificio ?te - tipo_edificio)
    :precondition (and
        (not (ocupado ?u))
        (unidadTipo ?u vce)
        (nodo ?r ?l)
        (en ?u ?l)
        (recursoTipo ?r ?tr)
        (or (not (recursoTipo ?r gas)) (and (construido ?e ?l) (edificioTipo ?e extractor)))
        )
    :effect (and
        (tenemos ?tr)
        (ocupado ?u)
    )
)

(:action construir
    :parameters (?u - unidad ?e - edificio ?te - tipo_edificio ?l - localizacion ?ea - edificio)
    :precondition (and
        (forall (?x - localizacion)(not (construido ?e ?x)))
        (not (ocupado ?u))
        (unidadTipo ?u vce)
        (en ?u ?l)
        (not (construido ?ea ?l))
        (edificioTipo ?e ?te)
        (forall (?t - tipo_recurso)
            (imply (requiere ?te ?t) (tenemos ?t))
        )
    )
    :effect (and
        (construido ?e ?l)
    )
)

(:action reclutar
    :parameters (?u - unidad ?tu - tipo_unidad ?e - edificio ?te - tipo_edificio ?l - localizacion)
    :precondition (and 
        (construido ?e ?l)
        (edificioTipo ?e ?te)
        (forall (?t - tipo_recurso)
            (imply (necesita ?tu ?t) (tenemos ?t))
        )
        (forall (?x - tipo_unidad)
            (not (unidadTipo ?u ?x))
        )
        (genera ?te ?tu)
    )
    :effect (and
        (unidadTipo ?u ?tu)
        (en ?u ?l)
    )
)


)