function [Q, des, blocked, active, link_list] = init_policy_pattern(L, free_motion, action_state_relation_idx, varargin)
%build_policy builds the baseline policy matrix with desired states and blocked states taken into account.
% This is the reference that is then optimized.
%
% Mario Coppola, 2018

n_agents = checkifparameterpresent(varargin, 'n_agents', 10, 'array');

if nargin == 1
    free_motion = 0;
    action_state_relation_idx = 1:8;
elseif nargin == 2
    action_state_relation_idx = 1:8;
end

% Make semides
semides  = [];
for i = 1:size(L,1)
    semides_buf = permn(0:1,length(find(L(i,:))));
    sm = semides_buf(sum(semides_buf,2)>0,:);
    semides_buf = repmat(L(i,:),size(sm,1),1);
    semides_buf(:,find(L(i,:))) = sm;
    semides = [semides; semides_buf];
end
L = semides;

[link_list, score] = get_score(L, n_agents);

% Initialize full Q matrix
Q = zeros(size(link_list, 1), size(L, 2));
cnt = 1;
des = zeros(1, size(L, 1));

for i = 1:size(link_list, 1)
    % If free_motion=true then we ignore Sdes. No "happy" states.
    if ~free_motion
        if score(i) > 7
            Q(i, :) = 0;
            des(cnt) = i;
            cnt = cnt + 1;
            continue;
        end
    end
 
    possibleactions = get_possibleactions(link_list(i, :));
    Q(i, possibleactions) = 1; % Set possible actions
end

Q = Q(:, action_state_relation_idx);
Q = uint8(Q > 0);

static = find(sum(Q, 2) < 0.01);
blocked = setdiff(static',des);
active = setdiff(1:size(Q, 1), static);

end
