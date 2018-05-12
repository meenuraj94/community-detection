%{
Finds the Estrada's communicability measure for every source-target pair for a given b value
%}


function G = estrada_communicability(A,b)
    n = size(A,1);
    k = sum(A);
    [k_sort,k_index] = unique(k);
    G = expm(b*A);
    figure, contourf(k_sort, k_sort, G(k_index,k_index)); title('Contour of communicability Gpq'); axis square; colorbar;
    xlabel('Degree of source node'); ylabel('Degree of destination node');
    figure, imagesc(G); axis square; title('Communicability Gpq'); colorbar;
    xlabel('Nodes'); ylabel('Nodes');