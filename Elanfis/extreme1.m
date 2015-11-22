function [ op1 ] = extreme1(trndata,normweight,c)
     %%size(normweight) 
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
      
      

      ech1 = hnew*hnew';
%       ech2 = hnew'*hnew;
      
      for i = 1:length(c)
          in1 = (eye(length(ech1))/(2^c(i))) + ech1;
%           in2 = (eye(length(ech2))/(2^c(i))) + ech2;
          op1(:,:,i) = hnew'*pinv(in1)*trndata(:,strndata(2));
%           op2(:,:,i) = pinv(in2)*hnew'*trndata(:,strndata(2));
      end
      
end

