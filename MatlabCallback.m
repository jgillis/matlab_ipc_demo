classdef MatlabCallback < handle
  methods
    function self = MatlabCallback(varargin)
        

    end
    function out = get_n_in(self)
      out = 2;
    end
    function out = get_n_out(self)
      out = 1;
    end
    function out = get_sparsity_in(self,i)
      switch(i)
          case 0
              out = int64([5,5]);
          case 1
              out = int64([5,1]);
          otherwise
              error('Internal error');
      end
    end
    function out = get_sparsity_out(self,i)
      switch(i)
          case 0
              out = int64([5,1]);
          otherwise
              error('Internal error');
      end
    end
    function out = get_name_in(self,i)
      names = {'A','b'};
      out = names{i+1};
    end
    function out = get_name_out(self,i)
      names = {'x'};
      out = names{i+1};
    end
    function [res] = eval(self, arg)
        A = arg{1};
        b = arg{2};
        x = A\b;
        res = {x};
    end

  end
end


