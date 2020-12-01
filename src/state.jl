mutable struct _State{T <: Number} # TODO: make an abstract state type
    values::Dictionary{Int,T} # TODO: handle multiple value type
    vars_costs::Dictionary{Int,Float64}
    cons_costs::Dictionary{Int,Float64}
    tabu::Dictionary{Int,Int}
end

# Accessors
_cons_costs(s::_State) = s.cons_costs
_vars_costs(s::_State) = s.vars_costs
_values(s::_State) = s.values
_tabu(s::_State) = s.tabu

_cons_costs!(s::_State, costs::Dictionary{Int,Float64}) = s.cons_costs = costs
_vars_costs!(s::_State, costs::Dictionary{Int,Float64}) = s.vars_costs = costs
_values!(s::_State{T}, values::Dictionary{Int,T}) where T <: Number = s.values = values
_tabu!(s::_State, tabu::Dictionary{Int,Int}) = s.tabu = tabu

_cons_cost(s::_State, c::Int) = _cons_costs(s)[c]
_var_cost(s::_State, x::Int) = _vars_costs(s)[x]
_value(s::_State, x::Int) = _values(s)[x]
_tabu(s::_State, x::Int) = _tabu(s)[x]

_cons_cost!(s::_State, c::Int, cost::Float64) = _cons_costs(s)[c] = cost
_var_cost!(s::_State, x::Int, cost::Float64) = _vars_costs(s)[x] = cost
_value!(s::_State{T}, x::Int, val::T) where T <: Number = _values(s)[x] = val
_decrease_tabu!(s::_State, x::Int) = _tabu(s)[x] -= 1
_delete_tabu!(s::_State, x::Int) = delete!(_tabu(s), x)

_length_tabu(s::_State) = length(_tabu(s))

function _insert_tabu!(s::_State, x::Int, tabu_time::Int)
    insert!(_tabu(s), x, tabu_time)
end

function _decay_tabu!(s::_State)
    foreach(
        ((x, tabu),) -> tabu == 1 ? _delete_tabu!(s, x) : _decrease_tabu!(s, x),
        pairs(_tabu(s))
    )
end

function _set!(s::_State{T}, x::Int, value::T) where T <: Number
    set!(_values(s), x, value)
end

function _swap_value!(s::_State, x::Int, y::Int)
    aux = _value(s, x)
    _value!(s, x, _value(s, y))
    _value!(s, y, aux)
end