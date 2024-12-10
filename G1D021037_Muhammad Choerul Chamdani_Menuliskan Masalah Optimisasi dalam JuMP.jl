using JuMP
using Ipopt

model = Model(Ipopt.Optimizer)

@variable(model, x1 >= 0)
@variable(model, x2 >= 0)

@constraint(model, 2*x1 + x2 >= 1)
@constraint(model, x1 + 3*x2 >= 1)

#1a
println("1(a) f0(x1, x2) = x1 + x2")
@objective(model, Min, (x1 + x2))
optimize!(model)
objective_value(model)
println("Optimal Value for (a): ", objective_value(model))
println("Optimal Solution for (e): (", value.(x1), ", ", value.(x2), ")")

#1b
println("1(b) f0(x1, x2) = x1 - x2")
@objective(model, Min, (-x1 -x2))
optimize!(model)
objective_value(model)
println("Optimal Value for (b): ", objective_value(model))
println("Optimal Solution for (e): (", value.(x1), ", ", value.(x2), ")")

#1c
println("1(c) f0(x1, x2) = x1")
@objective(model, Min, (x1))
optimize!(model)
objective_value(model)
println("Optimal Value for (c): ", objective_value(model))
println("Optimal Solution for (e): (", value.(x1), ", ", value.(x2), ")")

#1d
println("1(d) f0(x1, x2) = max{x1, x2}")
@objective(model, Min, x1)
optimize!(model)
objective_value(model)
println("Optimal Value for (d): ", objective_value(model))
println("Optimal Solution for (e): (", value.(x1), ", ", value.(x2), ")")

#1e
println("1(e) f0(x1, x2) = (x1)^2 + 9*(x2)^2}")
@objective(model, Min, (x1)^2 + 9*(x2)^2)
optimize!(model)
objective_value(model)
println("Optimal Value for (e): ", objective_value(model))
println("Optimal Solution for (e): (", value.(x1), ", ", value.(x2), ")")