cd("/Users/mproffett/Documents/R_projects/aoc_2025")
input = [parse.(Int, split(line, ",")) for line in readlines("day8.txt")]

function eucl_dist(pos1, pos2)
    return sqrt((pos1[1]-pos2[1])^2 + (pos1[2]-pos2[2])^2 + (pos1[3]-pos2[3])^2)
end

dist = Tuple{Int, Int, Float64}[]
for i in 1:(lastindex(input)-1)
    for j in i+1:lastindex(input)
        temp_d = eucl_dist(input[i], input[j])
        push!(dist, (i, j, temp_d))
        sort!(dist, by = last)
    end
end

first(dist, 10)

## go through and merge the box combos together into matching circuits frmo 1 - length(dist)
## Set union intersect 

circuits = Set[]
connections = 0
target = 10

for i in (1:lastindex(dist)-1)
    global connections

    if connections >= target
        break  # Stop once we've made enough connections
    end

    box1, box2 = dist[i][1], dist[i][2]
    s1 = Set([box1, box2])
    println("next pair: ",s1)

    s2 = findall(c -> !isempty(intersect(c, s1)), circuits)
    println("matches found: ",s2)
    if isempty(s2)
        push!(circuits, s1)
        println("circuits: ",circuits)
        connections += 1
    elseif length(s2) == 1
        union!(circuits[s2[1]],s1)
        println("circuits", circuits)
        connections += 1
    else 
        s3 = copy(s1)
        for ix in sort(s2, rev=true)
            union!(s3, circuits[ix])
            deleteat!(circuits, ix)
        end
        push!(circuits, s3)
        connections +=1
    end
end

top3_lengths = partialsort([length(c) for c in circuits], 1:3, rev=true)
part1 = prod(top3_lengths)