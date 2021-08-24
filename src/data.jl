show_version() = "_Version:_ $(today()).\n"

"""
    generate_samples(mean, sd, n)

Return `n` samples from a Gaussian distribution with `mean` and `sd`.

Using `StableRNG` and not `Random.seed` to have a stable seed even for different
Julia versions.
"""
function generate_samples(mean, sd, n)
    rng = StableRNG(1)
    dist = Normal(mean, sd)
    data = rand(rng, dist, n)
    round.(data; digits=2)
end

function commandos_data()
    n = 110
    group = fill("commandos", n)
    neuroticism = generate_samples(111.9, 16.7, n)
    extraversion = generate_samples(161.6, 12.8, n)
    DataFrame(; group, neuroticism, extraversion)
end

function civilians_data()
    n = 275
    group = fill("civilians", n)
    neuroticism = generate_samples(130.9, 37.2, n)
    extraversion = generate_samples(157.4, 33.1, n)
    DataFrame(; group, neuroticism, extraversion)
end

"""
    add_missing!(df)

Real data contains missing values, so we add a few.
At least the second value is also `missing`, so that it is visible for the reader.
"""
function add_missing!(df)
    rng = StableRNG(1)
    n = nrow(df)
    n_indices = round(Int, n/10)
    indices = [2; rand(rng, 1:n, n_indices)]
    allowmissing!(df, [:neuroticism, :extraversion])
    for i in indices
        # Missing can be in :neuroticism or :extraversion.
        # To make the filter a bit more difficult.
        col = rand(rng, [:neuroticism, :extraversion])
        df[i, col] = missing
    end
end

function dataset()
    df = vcat(commandos_data(), civilians_data())
    df[!, :participant] = 1:nrow(df)
    select!(df, :participant, :)
    add_missing!(df)
    # Using missingstring because it's non-trivial to filter empty cells.
    CSV.write("data.csv", df; missingstring="-1")
    df
end

function stacked_dataset()
    df = dataset()

    variable_name = :domain
    value_name = :score
    sdf = stack(df, [:neuroticism, :extraversion]; variable_name, value_name)
end

function first_and_last_few_rows(df)
    firsts = first(df, 4)
    lasts = last(df, 4)
    cols_and_dots = zip(names(df), fill(["..."], ncol(df)))
    pairs = [a => b for (a, b) in cols_and_dots]
    middle = DataFrame(pairs...)
    vcat(firsts, middle, lasts)
end

