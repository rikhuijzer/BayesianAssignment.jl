function plot_points()
    sdf = stacked_dataset()
    dropmissing!(sdf)
    xy = data(sdf) * mapping(:group, :score; row=:domain)
    draw(xy)
end

function plot_density()
    sdf = stacked_dataset()
    dropmissing!(sdf)

    dens = data(sdf) * mapping(:score, color=:group, row=:domain) * density()
    # Doesn't work for some reason.
    axis = (; ylabel="")
    draw(dens)
end
