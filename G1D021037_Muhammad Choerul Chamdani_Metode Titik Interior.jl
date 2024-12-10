using JuMP
using GLPK

# Membuat model optimisasi
model = Model(GLPK.Optimizer)

# Mendefinisikan variabel keputusan
@variable(model, x1 >= 0)  # Jumlah produk A
@variable(model, x2 >= 0)  # Jumlah produk B

# Menambahkan fungsi tujuan (maksimalkan keuntungan)
@objective(model, Max, 3 * x1 + 5 * x2) #Z = 3x1 + 5x2

# Menambahkan kendala
@constraint(model, 2 * x1 + x2 <= 20)   # Kendala 1 (2x1 + x2 <= 20)
@constraint(model, 4 * x1 + 5 * x2 <= 40) # Kendala 2 (4x1 + 5x2 <= 40)

# Menyelesaikan model
optimize!(model)

# Menampilkan hasil
println("Status: ", termination_status(model))
println("Jumlah produk A yang diproduksi (x1): ", value(x1))
println("Jumlah produk B yang diproduksi (x2): ", value(x2))
println("Keuntungan maksimum (Z): ", objective_value(model), " US Dollar")