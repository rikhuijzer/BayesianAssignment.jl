module BayesianAssignment

import CSV
import CairoMakie
import Makie

using Reexport: @reexport
@reexport begin
using AlgebraOfGraphics
using Books
using DataFrames
using Dates
using Distributions
using Random
using StableRNGs
end

export build

include("data.jl")
export dataset, first_and_last_few_rows, generate_samples

include("plots.jl")

function build()
    println("Generating content")
    fail_on_error = true
    dataset()
    Books.gen(; fail_on_error)
    extra_head = """
        <script src="https://cdn.usefathom.com/script.js" data-site="WYKYRAWQ" defer></script>
        """
    Books.build_all(; extra_head, fail_on_error)
end

end # module
