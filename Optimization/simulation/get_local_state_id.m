function idx = get_local_state_id(link_set)
%get_local_state_id returns the state ID given a binary neighbor set
%
% Mario Coppola, 2018
bitarray = zeros(1,size(link_set,2));
for i = 0:size(link_set,2)-1
    bitarray(size(link_set,2)-i) = 2^i;
end

idx = makehorizontal(sum(link_set .* bitarray, 2));

end
