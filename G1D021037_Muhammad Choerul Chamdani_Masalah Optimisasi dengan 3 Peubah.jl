#Deskripsi Masalah:
#Sebuah pabrik memproduksi tiga jenis produk: Produk A, Produk B, dan Produk C. 
#Setiap produk membutuhkan bahan baku yang berbeda dan memberikan keuntungan yang berbeda. 
#Pabrik ingin memaksimalkan keuntungan sambil mempertimbangkan batasan bahan baku yang tersedia.

using JuMP
using GLPK

# Membuat model optimisasi
model = Model(GLPK.Optimizer)

# Mendefinisikan variabel keputusan
@variable(model, x1 >= 0)  # Jumlah produk A
@variable(model, x2 >= 0)  # Jumlah produk B
@variable(model, x3 >= 0)  # Jumlah produk C

# Menambahkan fungsi tujuan (maksimalkan keuntungan)
@objective(model, Max, 3 * x1 + 5 * x2 + 2 * x3) #Z = 3x1 + 5x2 + 2x3

# Menambahkan kendala
@constraint(model, x1 + 2 * x2 + x3 <= 100)   # Kendala bahan I (x1+ 2x2 + x3 <= 100)
@constraint(model, 2 * x1 + x2 + 3 * x3 <= 150) # Kendala bahan II (2x1 + x2 + 3x2 <= 150)
@constraint(model, x1 + 3 * x2 + 2 * x3 <= 80) # Kendala bahan III (x1 + 3x2 + 2x3 <= 80)

# Menyelesaikan model
optimize!(model)

# Menampilkan hasil
println("Status: ", termination_status(model))
println("Jumlah produk A yang diproduksi (x1): ", value(x1))
println("Jumlah produk B yang diproduksi (x2): ", value(x2))
println("Jumlah produk C yang diproduksi (x3): ", value(x3))
println("Keuntungan maksimum (Z): ", objective_value(model), " US Dollar")