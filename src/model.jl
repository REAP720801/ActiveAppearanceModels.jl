
typealias Shape Matrix{Float64}

type ModelFrame
    mini::Int
    minj::Int
    maxi::Int
    maxj::Int
    h::Int
    w::Int
    ModelFrame(mini::Int, minj::Int, maxi::Int, maxj::Int) =
        new(mini, minj, maxi, maxj, int(ceil(maxi - mini + 3)), int(ceil(maxj - minj + 3)))
end

Base.size(frame::ModelFrame) = (frame.h, frame.w)

type Grad2D
    di::Matrix{Float64}
    dj::Matrix{Float64}
end

Base.show(io::IO, grad::Grad2D) = print(io, "Grad2D$(size(grad.di))")

type AAModel
    np::Int
    nc::Int
    frame::ModelFrame
    wparams::PAWarpParams
    s0::Vector{Float64}
    s_star::Matrix{Float64}
    S::Matrix{Float64}
    A0::Vector{Float64}
    A::Matrix{Float64}
    dA0::Vector{Grad2D}
    dW_dp::Array{Float64, 4}
    dN_dq::Array{Float64, 4}
    SD::Matrix{Float64}
    H::Matrix{Float64}
    invH::Matrix{Float64}
    R::Matrix{Float64}
    AAModel() = new()
end


Base.show(io::IO, m::AAModel) = print(io, "AAModel($(m.np))")

