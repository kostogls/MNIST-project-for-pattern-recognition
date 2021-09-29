
function [Y, eigvector, eigvalue]=PCA(X,d)

%finding eigvalues
S_x=cov(X);
[r,c]=eig(S_x);
eigvalue=diag(c);
[eigvalue,ix]=sort(eigvalue,'descend');
eigvector=r(:,ix);

%normalization
norm_eigvector=sqrt(sum(eigvector.^2));
eigvector=eigvector./repmat(norm_eigvector,size(eigvector,1),1);

%dimension reduction
eigvector=eigvector(:,1:d);
Y=X*eigvector;

