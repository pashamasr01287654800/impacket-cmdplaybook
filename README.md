# impacket-cmdplaybook

> Quick reference playbook for the `impacket-cmdplaybook.sh` interactive menu script. For lab and testing use only.

---

## Overview

`impacket-cmdplaybook.sh` is a Bash script that displays a colorized, numbered menu of Impacket command-line utilities. Selecting a number shows a compact usage template and a one-line description for that tool. The script is a read-only reference and does not execute attacks by itself. Use only in isolated labs and authorized testing environments.

## Features

* Colorized interactive menu (ANSI/tput compatible).
* 50 referenced Impacket tools with example usage and short descriptions.
* Input validation: forces numeric input and handles empty input.
* Simple, single-file Bash implementation.

## Requirements

* `bash` (POSIX-compatible).
* Terminal that supports ANSI escape sequences (most terminals).
* `tput` optional but not required.

## Installation

1. Save `impacket-cmdplaybook.sh` to your preferred folder.
2. Make it executable:

```bash
chmod +x impacket-cmdplaybook.sh
```

3. (Optional) Move to a directory in your `PATH`:

```bash
sudo mv impacket-cmdplaybook.sh /usr/local/bin/impacket-cmdplaybook
```

## Usage

Run the script from a terminal:

```bash
./impacket-cmdplaybook.sh
```

You will see a numbered list of tools. Type the tool number and press Enter to view the example and description. Valid choices are `1` to `50`. Enter `0` to exit.

If you press Enter without typing a number the menu will re-display and prompt again.


## Safety and Legal

This repository and the script are intended for defensive research, training, and lab use only. Do not use the referenced tools against systems you do not own or have explicit authorization to test. The author and repository make no guarantees and assume no liability for misuse.

---

*This README documents the provided **`impacket-cmdplaybook.sh`** script logic and usage. Examples in the script are lab-only templates and must be adapted to your environment.*
