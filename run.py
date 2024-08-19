import casadi as ca
import os


ca.DM.rng(1)
matlab_path = r"C:\Program Files\MATLAB\R2019b\bin\win64"

os.environ["PATH"] += os.pathsep + matlab_path 


this_dir = os.path.dirname(os.path.abspath(__file__))

options = {}
options["config_args"] = [this_dir, "MatlabCallback"]
F = ca.external('F',os.path.join(ca.GlobalOptions.getCasadiPath(),'libmatlab_ipc.dll'),options)

print("Computed by Matlab, from casadi-python")
print(F(ca.DM.rand(5,5),ca.DM.rand(5,1)))