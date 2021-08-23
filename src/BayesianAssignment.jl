module BayesianAssignment

import CSV

using Reexport: @reexport
@reexport using AlgebraOfGraphics
@reexport using Books
@reexport using DataFrames
@reexport using Dates
@reexport using Distributions
@reexport using Random
@reexport using StableRNGs

export build

include("data.jl")
export dataset, first_and_last_few_rows, generate_samples

include("plots.jl")

function build()
    println("Generating content")
    fail_on_error = true
    Books.gen(; fail_on_error)
    Books.build_all(; fail_on_error)
end

end # module
