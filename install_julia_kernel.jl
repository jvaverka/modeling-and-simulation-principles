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
Pkg.add("IJulia")
Pkg.build("IJulia")

# Load modules for kernel installation
import IJulia

# Set kernel name and path
const KERNEL_NAME = "model-sim-book-jl"

# Install kernel using new system image
IJulia.installkernel(KERNEL_NAME)
