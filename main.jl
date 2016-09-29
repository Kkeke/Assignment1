include("program_counter.jl")
import pc
#define banks and cpu flags
println("")
BankA = Array{UInt8}(16)
BankB = Array{UInt8}(16)

#initial BANKs
for i = 1:16
	BankA[i] = 0
	BankA[i] = 0
end

type flags
	Z :: Int
	C :: Int
	IE :: Int
	REGBANK :: Char
end

flag = flags(0,0,0,'A')

println("-----------KCPSM6 simulated-----------")
if length(ARGS)  > = 1
	FILE_NAME = ARGS[1]
else
	


#cheak file existance 
if !isfile(FILE_NAME)
	println(FILE_NAME," DOES NOT EXIST\nProgram exit in 5s")
	sleep(4)
	exit()
end

println("Reading Assembly Code ... ...")

#loading file to code_arr
f = open(FILE_NAME)
length_of_line = length(readlines(f))
f = open(FILE_NAME)
code_arr = Array{String}(0)
for i = 1:length_of_line
  push!(code_arr,readline(f))
end
close(f)
