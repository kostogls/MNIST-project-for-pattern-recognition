function [ cl, centre ] = kMeans( k, data )

nP = size(data,2); 
dP = size(data,1); 


randIdx = randperm(nP,k);

centre = data(:,randIdx);

%%tried to initialize with maxmin but doesn't work well
%randIdx = randperm(nP,1);
%centre(:,1)= data(:,randIdx);
%n=2;
%while n<=4
%    centre(:,k)=max(sqrt(data(1,:)-centre(1,n-1)).^2+(data(2,:)-centre(2,n-1)).^2);
%    n=n+1;
%end
%%

% initialize cluster array
cl = zeros(1,nP);

% initialize previous cluster array for stopping
clPrev = cl;

it = 0;

% init stopping criterion
cont = true; 

while cont == true
    
    for idxP = 1:nP
        % init distance array dist
        dist = zeros(1,k);
        % compute distance to each centroid
        for idxC=1:k
            dist(idxC) = norm(data(:,idxP)-centre(:,idxC));
        end
        % find cluster
        [~, clusterP] = min(dist);
        cl(idxP) = clusterP;
    end
    
    centre = zeros(dP,k);
    
    for idxC = 1:k
        
        centre(:,idxC) = mean(data(:,cl==idxC),2);
    end
    
    if clPrev==cl
        cont = false;
    end
  
    clPrev = cl;
    
    it = it + 1;
    
end

end
