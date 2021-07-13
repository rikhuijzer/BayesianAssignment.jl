function plot_points()
    sdf = stacked_dataset()
    xy = data(sdf) * mapping(:group, :score; row=:domain)
    draw(xy)
end

function plot_density()
    sdf = stacked_dataset()

    dens = data(sdf) * mapping(:score, color=:group, row=:domain) * density()
    draw(dens)
end
