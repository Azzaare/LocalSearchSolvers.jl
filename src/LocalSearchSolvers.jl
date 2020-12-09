module LocalSearchSolvers

# TODO: return types: nothing, ind for internals etc

# Imports
import Dictionaries: Dictionary, Indices, DictionaryView, insert!, set!
import Base: ∈
import Lazy: @forward

# Exports internal
export constraint!, variable!, objective!, add!, add_var_to_cons!, add_value!
export delete!, delete_value!, delete_var_from_cons!
export domain, variable, constraint, objective
export Constraint, Objective, Variable
export length_var, length_cons, constriction, draw, ∈, describe
export get_variable, get_variables, get_constraint, get_constraints, get_objective, get_objectives
export get_cons_from_var, get_vars_from_cons, get_domain, get_name

# Exports Problem
export Problem, sudoku

# Exports error/predicate functions
export all_different

# Exports Solver
export Solver, solve!, specialize, specialize!, Settings

# Includes utils
include("utils.jl")

# Includes internal structures
include("domain.jl")
include("variable.jl")
include("constraint.jl")
include("objective.jl")

# Includes solvers
include("problem.jl")
include("state.jl")
include("solver.jl")

# Includes specific problems
include("problems/sudoku.jl")
include("problems/golomb.jl")

# Includes usual constraints
include("constraints/all_different.jl")

end
