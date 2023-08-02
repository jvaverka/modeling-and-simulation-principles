using ModelingToolkit
using DifferentialEquations
using Plots

@variables t x(t)   # independent and dependent variables
@parameters τ       # parameters
@constants h = 1    # constants have an assigned value
D = Differential(t) # define an operator for the differentiation w.r.t. time

# your first ODE, consisting of a single equation, the equality indicated by ~
@named fol = ODESystem([D(x) ~ (h - x) / τ])

prob = ODEProblem(fol, [x => 0.0], (0.0, 10.0), [τ => 3.0])
# parameter `τ` can be assigned a value, but constant `h` cannot
sol = solve(prob)

plot(sol)
