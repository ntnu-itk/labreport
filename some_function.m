function out = some_function(X1)
%Generic text

degree = 6;
out = ones(size(X1(:,1)));
for i = 1:degree
	for j = 0:i
		out(:, end+1) = (X1.^(i-j)).*(X2.^j);
	end
end

end
