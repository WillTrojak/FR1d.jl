
include("./domain.jl")
include("./element.jl")

import .Domain
import .Element

function main()

    Omega = Domain.BaseDomain{Float32}(20, 3)
    Domain.generate_grid!(Omega, 1, 0)

    FR = Element.BaseElement{Float32}(Omega)
    
end

main()
