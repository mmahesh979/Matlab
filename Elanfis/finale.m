function [ output ] = finale(trndata,normweight,pqr)
      hnew= [];
      strndata = size(trndata);
      noatt = strndata(2)-1;
      [t y] = size(normweight);
      tdata = [trndata(:,1:noatt) ones(strndata(1),1)]; %concatenating matrices
      [q w] = size(tdata);
      for i = 1 : y
          for j = 1 : w 
             h(:,j) = normweight(:,i) .* tdata(:,j);
          end
          hnew = [hnew h];
      end
      output = hnew*pqr;

end

