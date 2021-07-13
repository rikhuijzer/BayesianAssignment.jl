module BayesianAssignment

import CSV

using Reexport: @reexport
@reexport using AlgebraOfGraphics
@reexport using Books
@reexport using DataFrames
@reexport using Distributions
@reexport using Random
@reexport using StableRNGs

export build_pdf
include("data.jl")
export dataset, first_and_last_few_rows, generate_samples
include("plots.jl")

function build_pdf()
    println("Generating content")
    Books.gen(; fail_on_error=true)
    println("Building pdf")
    Books.pdf()
end

end # module
