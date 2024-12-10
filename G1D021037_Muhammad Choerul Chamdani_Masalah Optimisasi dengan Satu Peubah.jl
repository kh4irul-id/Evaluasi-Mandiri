#Deskripsi Masalah:
#Seorang petani ingin memaksimalkan hasil panen dari tanaman jagung. Petani tersebut memiliki lahan seluas 1000 m² dan ingin menentukan berapa banyak jagung yang harus ditanam untuk memaksimalkan hasil panen.
#Fungsi Tujuan:
#Misalkan setiap kilogram jagung yang ditanam menghasilkan keuntungan sebesar $5. Jika kita mendefinisikan x sebagai jumlah kilogram jagung yang ditanam, maka fungsi tujuan dapat dinyatakan sebagai:

using JuMP
using GLPK

# Membuat model optimisasi
model = Model(GLPK.Optimizer)

# Mendefinisikan variabel keputusan
@variable(model, x >= 0)  # Jumlah kilogram jagung yang ditanam

# Menambahkan fungsi tujuan (maksimalkan keuntungan) Z = 5x
@objective(model, Max, 5 * x)

# Menambahkan kendala
@constraint(model, 10 * x <= 1000)   # Batasan lahan yang tersedia 10x <= 1000

# Menyelesaikan model
optimize!(model)

# Menampilkan hasil
println("Status: ", termination_status(model))
println("Jumlah kilogram jagung yang sebaiknya ditanam (x): ", value(x))
println("Keuntungan maksimum (Z): ", objective_value(model), " US Dollar ")