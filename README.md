# ModelSimBook

> Notes from the textbook _Principles of Object-Oriented Modeling and Simulation
> with Modelica 3.3_ by Peter Fritzson.

## Workflow

1. Start JupyterLab
1. Modify notes as Jupyter Notebooks
1. Modify `books/chapters` section in `_quarto.yml` to reflect changes
1. Commit changes to GitHub
1. Publish changes with `quarto publish gh-pages`

## Setup

- [Quarto](https://quarto.org/docs/get-started/) v1.3.x is required
  [for newer Julia kernels](https://github.com/quarto-dev/quarto-cli/issues/2539)
- Install [JupyterLab](https://jupyter.org/install)
- Run `install_julia_kernel.jl` with Julia v1.9 to build the kernel

### Experimental

- Run `install_fast_kernel.jl` with Julia v1.9 to build a kernel with a precompiled
  system image
- Run `install_jupyter_lab.jl` with Julia v1.9 to install JupyterLab via `Conda.jl`
