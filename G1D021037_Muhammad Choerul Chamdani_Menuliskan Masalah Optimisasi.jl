#Network Flow Problem

using JuMP
using GLPK
using Ipopt

# Matriks P
P = [13 12 -2; 12 17 6; 2 6 12]

# Vektor q
q = [-22.0, -14.5, 13.0]

# Konstanta r
r = 1.0

# Membuat model optimisasi
model = Model(Ipopt.Optimizer)

# Variabel keputusan
@variable(model, -1 <= x[1:3] <= 1)

# Fungsi tujuan
@objective(model, Min, 0.5 * sum(P[i, j] * x[i] * x[j] for i in 1:3, j in 1:3) + q' * x + r)

# Menyelesaikan masalah
optimize!(model)

# Mendapatkan hasil
optimal_value = objective_value(model)
optimal_x = value.(x)

# Menampilkan hasil
println("Nilai optimal dari fungsi tujuan: ", optimal_value)
println("Solusi optimal x: ", optimal_x)
