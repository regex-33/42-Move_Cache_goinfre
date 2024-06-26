⚠️ **WARNING**: None of these commands preserve your cache or application data (e.g., Chrome, VSCode, etc.). Therefore, ensure that you are logged in to your applications and have synchronization enabled before running the scripts. After running them, remember to log back in to resynchronize your data and automatically redownload your extensions. ⚠️


# Introduction

These scripts are designed to automate the process of moving cache directories to a designated location, specifically a goinfre directory, to alleviate storage constraints on your main drive. The install.sh script facilitates the setup by downloading the necessary script and configuring it to run automatically on login. The 42-move_cache.sh script is responsible for moving the cache directories to the specified location.


# Move Cache to Goinfre

These scripts automate the process of moving cache directories to a designated location (goinfre directory) to free up space on the main drive. The `install.sh` script facilitates the setup by downloading the necessary script and configuring it to run automatically on login. The `42-move_cache.sh` script is responsible for moving the cache directories to the specified location.

## Installation

Run the `install.sh` script with the `--cluster` argument followed by either `mac` or `dell`, depending on your system.

```bash
./install.sh --cluster mac
```

This will download the 42-move_cache.sh script, set up a desktop entry to run it automatically on login, and move cache directories to the designated goinfre directory.

Usage
After installation, log out and log back in to execute the 42-move_cache.sh script automatically. Do not run the 42-move_cache.sh script directly.

The cache directories listed in the script will be moved to the goinfre directory specified during installation.

