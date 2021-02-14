module FRMatrices

import Polynomials
import SpecialPolynomials

export differentiation_matrix
export interpolation_matrix


function interpolation_matrix(x1::Array{Number, 1}, x2::Array{Number, 1})::Array{Number, 2}
    n1 = length(x1)
    n2 = length(x2)
    p = n1 - 1
    V1 = [SpecialPolynomials.basis.(SpecialPolynomials.Legendre, i)(x1[j]) for i=0:p, j=1:n1]
    V2 = [SpecialPolynomials.basis.(SpecialPolynomials.Legendre, i)(x2[j]) for i=0:p, j=1:n2]
    return inv(V1)*V2
end

function differentiation_matrix(x::Array{Number, 1})::Array{Number, 2}
    n = length(x)
    p = n - 1
    V = [SpecialPolynomials.basis.(SpecialPolynomials.Legendre, i)(x[j]) for i=0:p, j=1:n]
    Vd = [Polynomials.derivative(convert(Polynomials.Polynomial, SpecialPolynomials.basis.(SpecialPolynomials.Legendre, i)))(x[j]) for i=0:p, j=1:n]
    return inv(V)*Vd
end

end
