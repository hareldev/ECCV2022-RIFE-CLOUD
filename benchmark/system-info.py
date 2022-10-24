import subprocess
import torch
import os

print("=== CPU Info:")
print((subprocess.check_output("lscpu", shell=True).strip()).decode())
print()

print("=== RAM Info:")
mem_bytes = os.sysconf('SC_PAGE_SIZE') * os.sysconf('SC_PHYS_PAGES')  # e.g. 4015976448
mem_gib = mem_bytes/(1024.**3)  # e.g. 3.74
print('Physical Memory:', round(mem_gib,1), 'GB')
print()

print("=== GPU Info:")
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print('Using device:', device)
print()

#Additional Info when using cuda
if device.type == 'cuda':
    print(torch.cuda.get_device_name(0))
    print('Memory Usage:')
    print('Total:', round(torch.cuda.get_device_properties(0).total_memory/1024**3,1), 'GB')
    print('Allocated:', round(torch.cuda.memory_allocated(0)/1024**3,1), 'GB')
    print('Cached:   ', round(torch.cuda.memory_reserved(0)/1024**3,1), 'GB')