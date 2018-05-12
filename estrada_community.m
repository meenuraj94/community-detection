% Input: G - Communicability Matrix
% A - Adjacency Matrix
% Output - C - Communities of A

function C = estrada_community(G, A)
    [V, D] = eig(A);
    n = size(A,1);
    phi1 = V(:, n);
    lambda1 = D(n,n);
    first = phi1 * transpose(phi1) * exp(lambda1);
    del_G = G - first;
    sign_del_G = zeros(n,n);
    for i = 1:n
        for j = 1:n
            if del_G(i,j) > 0
                sign_del_G(i,j) = 1;
            end
        end
    end
    SC = ELSclique(sign_del_G);
    C = full(SC);
    imagesc(del_G); title('Communicability that decides community'); axis square; colorbar;
    imagesc(C); title('Communities'); colorbar;