module Element

import ..Domain

export BaseElement

mutable struct BaseElement{T<:AbstractFloat}
    Omega::Domain.BaseDomain{T}
    qs::Array{T,2}
    qf::Array{T,2}

    function BaseElement{T}(Omega::Domain.BaseDomain{T}) where {T<:AbstractFloat}
        qs = Array{T, 2}(undef, Omega.nele, Omega.ns)
        qf = Array{T, 2}(undef, Omega.nele, Omega.nf)

        new(Omega, qs, qf)
    end
end

BaseElement(Omega::Domain.BaseDomain{T}) where {T<:AbstractFloat} = BaseElement{T}(Omega)



end
