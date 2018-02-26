function vertex = read3Dwrl(filename)


fp = fopen(filename,'r');
if fp == -1
    fclose all;
    error(['Cannot open file ' filename]);
end

tempstr = ' ';

key = 'point [';
vertex = [];

while ( tempstr ~= -1)
    tempstr = fgets(fp);   % -1 if eof
    if( ~isempty(findstr(tempstr,key)) )
        [vertex,nc] = fscanf(fp,'%f%c %f%c %f%c', Inf);
        
        vertex = reshape(vertex, [6,length(vertex)/6]);
        vertex([2 4 6],:) = [];

        break;
    end
end

end