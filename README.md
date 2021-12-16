# hello-python

## Description

Python starter repository.

## Environment Setup

Before you being you will need to get your [Artifactory API Key](https://hqo.jfrog.io/ui/admin/artifactory/user_profile)

```bash
# Install the packages and set up your environment.
./script/setup.sh
```

This will install the following tools:

- [asdf](https://asdf-vm.com/) - Extendable version manager with support for Ruby, Node.js, Erlang & more
  - [python](https://www.python.org/) - Interpreted, interactive, object-oriented programming language
- [docker](https://www.docker.com/) - Pack, ship and run any application as a lightweight container
- [git](https://git-scm.com/) - Distributed revision control system
- [pre-commit](https://pre-commit.com/) - Framework for managing multi-language pre-commit hooks
- [shellcheck](https://www.shellcheck.net/) - Static analysis and lint tool, for (ba)sh scripts
- [shfmt](https://github.com/mvdan/sh/) - Autoformat shell script source code
- [visual-studio-code](https://code.visualstudio.com/) - Microsoft Visual Studio Code
- [zsh](https://www.zsh.org/) - UNIX shell (command interpreter)

### Development Environment Setup

1. Create virtual environment

```
pip install virtualenv
python3 -m venv env
```

2. Activate virtual environment

```
source env/bin/activate
```

3. Install required packages

```
pip install -r requirements.txt
```

## Development Tools

### VS Code

These are the required extensions you need to install:

- [HqO Extension Pack](https://marketplace.visualstudio.com/items?itemName=HqO.hqo-extension-pack)
  This installs all the required plugins needed for working with NodeJS at HqO

These are some helpful ones:

- [Better Comment](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments) for comment highlightshighlighting
