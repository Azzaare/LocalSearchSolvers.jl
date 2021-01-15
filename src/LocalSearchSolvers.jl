module LocalSearchSolvers

# TODO: return types: nothing, ind for internals etc

# Imports
import Dictionaries: Dictionary, Indices, DictionaryView, insert!, set!
import Base: ∈, convert
import Lazy: @forward
import Constraints: usual_constraints, error_f
import CompositionalNetworks: optimize!, csv2space, compose, ICN
import ConstraintDomains: AbstractDomain, domain, _add!, _delete!, _draw, _length, _get_domain
import ConstraintDomains: _get

# Exports internal
export constraint!, variable!, objective!, add!, add_var_to_cons!, add_value!
export delete!, delete_value!, delete_var_from_cons!
export domain, variable, constraint, objective
export Constraint, Objective, Variable
export length_var, length_cons, constriction, draw, ∈, describe
export get_variable, get_variables, get_constraint, get_constraints, get_objective, get_objectives
export get_cons_from_var, get_vars_from_cons, get_domain, get_name, solution

# Exports Model
export Model, sudoku, golomb, mincut

# Exports error/predicate/objective functions
export o_dist_extrema, o_mincut

# Exports Solver
export Solver, solve!, specialize, specialize!, Settings

# Include utils
include("utils.jl")

# Include internal structures
include("variable.jl")
include("constraint.jl")
include("objective.jl")

# Include solvers
include("model.jl")
include("state.jl")
include("solver.jl")

# Include specific models
include("models/sudoku.jl")
include("models/golomb.jl")
include("models/cut.jl")

# Include usual objectives
include("objectives/extrema.jl")
include("objectives/cut.jl")

end
