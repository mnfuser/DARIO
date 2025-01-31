# PROVA CHIAVE ----

## COD_AZI + SDO_NEO

table(str_length(cedap$COD_AZI))
table(str_length(cedap$PROG_SDO))
table(str_length(cedap$PROG_PAZ))

cedap$key=paste0(cedap$COD_AZI,"_", str_pad(cedap$SDO_NEO, width = 8, side = 'left', pad = '0', use_width = T))
length(unique(cedap$key))
length(which(duplicated(cedap$key)==T))

dupByKey = cedap |> group_by(key) |> filter(n()>1) |> count()

dupCedap = cedap |> filter(key %in% dupByKey$key)

write_csv2(dupCedap, file=paste0(exportDir,"/duplicati_codazi_sdoneo.csv"))

## prog_paz_neo prova

table(str_length(cedap$COD_AZI))
table(str_length(cedap$SDO_NEO))
table(str_length(cedap$prog_paz_neo))

length(unique(cedap$prog_paz_neo))
length(which(duplicated(cedap$prog_paz_neo)==T))

dupByKey = cedap |> group_by(prog_paz_neo) |> filter(n()>1) |> count()

dupCedap = cedap |> filter(prog_paz_neo %in% dupByKey$prog_paz_neo)

write_csv2(dupCedap, file=paste0(exportDir,"/duplicati_prog_paz_neo.csv"))
