# Confirm the latest Julia release is in use
const MAJOR = 1
const MINOR = 9
@assert Int(VERSION.major) == MAJOR && Int(VERSION.minor) == MINOR "Please use Julia v$(MAJOR).$(MINOR)"

# Add and build required packages for setup
import Pkg
Pkg.activate(@__DIR__)
Pkg.add("ModelingToolkit")
Pkg.add("ModelingToolkitStandardLibrary")
Pkg.add("DifferentialEquations")
Pkg.add("Plots")
Pkg.add("PackageCompiler")
Pkg.add("IJulia")
Pkg.build("IJulia")

# Load modules for kernel installation
import PackageCompiler
import IJulia

# Set kernel name and path
const KERNEL_NAME = "model-sim-book-jl"
sysimage_path = if Sys.iswindows()
    joinpath(@__DIR__, "$(KERNEL_NAME).dll")
else
    joinpath(@__DIR__, "$(KERNEL_NAME).so")
end

# Create system image with modeling and simulation modules included
PackageCompiler.create_sysimage(
    [
        "ModelingToolkit",
        "ModelingToolkitStandardLibrary",
        "DifferentialEquations",
        "Plots"
    ];
    sysimage_path,
    precompile_execution_file="precompile.jl"
)

# Install kernel using new system image
IJulia.installkernel(
    KERNEL_NAME,
    "--sysimage=$(sysimage_path) --project=@. --startup-file=no",
    env = Dict("JULIA_NUM_THREADS" => "6")
)
