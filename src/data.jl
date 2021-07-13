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
    N = generate_samples(111.9, 16.7, n)
    E = generate_samples(161.6, 12.8, n)
    DataFrame(; group, N, E)
end

function civilians_data()
    n = 275
    group = fill("civlians", n)
    N = generate_samples(130.9, 37.2, n)
    E = generate_samples(157.4, 33.1, n)
    DataFrame(; group, N, E)
end

function dataset()
    df = vcat(commandos_data(), civilians_data())
    df[!, :participant] = 1:nrow(df)
    select!(df, :participant, :)
    df
end

function stacked_dataset()
    df = dataset()

    variable_name = :domain
    value_name = :score
    sdf = stack(df, [:N, :E]; variable_name, value_name)
end

function first_and_last_few_rows(df)
    firsts = first(df, 4)
    lasts = last(df, 4)
    cols_and_dots = zip(names(df), fill(["..."], ncol(df)))
    pairs = [a => b for (a, b) in cols_and_dots]
    middle = DataFrame(pairs...)
    vcat(firsts, middle, lasts)
end
