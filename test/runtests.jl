using LocalSearchSolvers
using Dictionaries
using Test

import Constraints: usual_constraints, error_f

const LS = LocalSearchSolvers

@testset "LocalSearchSolvers.jl" begin
    # include("internal.jl")
    # include("problems.jl")
    # include("functions.jl")
    include("moi.jl")
end
