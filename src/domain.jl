\module Domain

import GaussQuadrature

export BaseDomain

export generate_grid!

mutable struct BaseDomain{T<:AbstractFloat}
    nele::Integer
    p::Integer
    ns::Integer
    nf::Integer

    xref::Array{T, 1}
    xn::Array{T, 2}
    xs::Array{T, 2}
    dets::Array{T, 2}
    
    function BaseDomain{T}(nele::Integer, p::Integer) where T<:AbstractFloat
        ns = p + 1
        nf = 2

        xref = Array{T, 1}(undef, ns)
        xn = Array{T, 2}(undef, nele, 2)
        xs = Array{T, 2}(undef, nele, ns)
        dets = Array{T, 2}(undef, nele, ns)
        
        new(nele, p, ns, nf, xref, xn, xs, dets)
    end
end

BaseDomain(nele::Integer, p::Integer) = BaseDomain{T}(nele, p)

function generate_grid!(L::AbstractFloat, x0::AbstractFloat)
    Omega.xref, w = GaussQuadrature.legendre(Omega.ns)
    dx = L/Omega.nele
    for i=1:Omega.nele
        Omega.xn[i, 1] = x0 + (i - 1)*dx
        Omega.xn[i, 2] = x0 + (i + 0)*dx
        for j=1:Omega.ns
            Omega.xs[i, j] = Omega.xn[i, 1] + 0.5*dx*(Omega.xref[j] + 1)
            Omega.dets[i, j] = 2/dx
        end
    end
end

function connectivity!(Omega::BaseDomain)
    
end

end
