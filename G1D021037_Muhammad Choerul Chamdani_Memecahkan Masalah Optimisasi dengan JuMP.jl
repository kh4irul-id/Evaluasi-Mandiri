using JuMP
using Ipopt

# Membuat model optimasi
model = Model(Ipopt.Optimizer)

# Membuat variabel panjang sisi kotak (p) dan panjang leher (l)
@variable(model, p >= 0)
@variable(model, l >= 0)

# Membuat konsentrasi untuk memenuhi kondisi p + l <= 5
@constraint(model, p + l <= 5)

# Membuat objek fungsi yang akan diperbesar (luas kotak)
@objective(model, Max, p * l)

# Mencari solusi optimal
optimize!(model)

# Mencetak nilai optimal dari p dan l
println("Nilai optimal p: ", value(p))
println("Nilai optimal l: ", value(l))

# Mencetak luas maksimum yang diperoleh
println("Luas maksimum: ", (value(p)*value(l)))