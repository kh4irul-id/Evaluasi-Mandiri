#Seorang pengusaha ingin memproduksi dua jenis produk, yaitu Produk A dan Produk B. Produk A memerlukan 2 jam kerja dan memberikan keuntungan sebesar $3 per unit, 
#sedangkan Produk B memerlukan 1 jam kerja dan memberikan keuntungan sebesar $2 per unit. Pengusaha memiliki total 8 jam kerja per hari. 
#Selain itu, pengusaha ingin memproduksi setidaknya 1 unit dari Produk A.

using JuMP
using GLPK

# Membuat model optimisasi
model = Model(GLPK.Optimizer)

# Mendefinisikan variabel keputusan
@variable(model, x1 >= 0, Int)  # Produk A (integer)
@variable(model, x2 >= 0)        # Produk B (continuous)

# Menambahkan fungsi tujuan Z=3x1+2x2
@objective(model, Max, 3 * x1 + 2 * x2)

# Menambahkan kendala
@constraint(model, 2 * x1 + x2 <= 8) # 2x1*x2<=8
@constraint(model, x1 >= 1) #x1>1

# Menyelesaikan model
optimize!(model)

# Menampilkan hasil
println("Status: ", termination_status(model))
println("Jumlah Produk A yang diproduksi: ", value(x1))
println("Jumlah Produk B yang diproduksi: ", value(x2))
println("Keuntungan maksimum: ", objective_value(model))