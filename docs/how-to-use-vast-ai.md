# How to use Vast.ai

## Steps:
  1. Create an account with vast.ai
  2. Install CLI using this [quickstart document](https://vast.ai/console/cli/) or the [extended version](https://github.com/vast-ai/vast-python#Quickstart) \
  windows users could use WSL2 and run commands from Ubuntu 20.04
  3. Using CLI/Web UI select an instance to rent. General recommendations are: \
    1. Single GPU - No need to pay extra for array of GPUs when RIFE can only consume a single GPU. \
    2. Modern GPU - a minimum of RTX 2xxx (> 15 TFLOPS) \
    3. Decent network speed - Since we require to download the pre-processed models (30GB), and we pay for the time it takes to download it.
    4. Start the Interruptible / On-Demand instance (via bid / rent) with the following options:
      - Image name:
      - Docker.io credentials: 
      - Disk size
