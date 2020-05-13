(define (domain ejercicio3)

(:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
(:types
    localizacion recurso unidad edificio - object
)
(:constants
    vce - tipo_unidad
    centro_de_mando barracones extractor - tipo_edificio
    minerales gas - tipo_recurso
)
(:predicates
    (conectado ?x ?y - localizacion)

    (en ?u - unidad ?x - localizacion)
    (ocupado ?v - unidad)

    (construido ?e - edificio ?x - localizacion)
    (requiere ?te - tipo_edificio ?r - tipo_recurso)

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
        (not (ocupado ?u))
        )
    :effect (and
        (en ?u ?y)
        (not (en ?u ?x))
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
        (tenemos ?tr)
        (ocupado ?u)
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
            (imply (requiere ?te ?t) (tenemos ?t))
        )
    )
    :effect (and
        (construido ?e ?l)
    )
)

)