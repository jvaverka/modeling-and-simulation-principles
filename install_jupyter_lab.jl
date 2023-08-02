# Confirm the latest Julia release is in use
const MAJOR = 1
const MINOR = 9
@assert Int(VERSION.major) == MAJOR && Int(VERSION.minor) == MINOR "Please use Julia v$(MAJOR).$(MINOR)"

# Install Conda
import Pkg
Pkg.activate(@__DIR__)
Pkg.add("Conda")
Pkg.build("Conda")

# Install JupyterLab using Conda
import Conda
Conda.add("jupyterlab"; channel="conda-forge")
@info "Restart Julia and verify `@show Conda.ROOTENV` contains JupyterLab"
