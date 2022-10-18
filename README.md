# Introduction

Pre-commit plugin to run credo as a git pre-commit hook.

## Usage

### Are you already using pre-commit?

Add the following snippet to your `.pre-commit-config.yaml` file

```yaml
- hooks:
    - id: credo-check
  repo: git@github.com:elephantoss/pre-commit-credo.git
  rev: v0.0.1
```

### First time using pre-commit?
You first need to create your `.pre-commit-config.yaml` in the root folder of your project and then copy and paste the following into the `.pre-commit-config.yaml` file.

```yaml
repos:
  - hooks:
      - id: credo-check
    repo: git@github.com:elephantoss/pre-commit-credo.git
    rev: v0.0.1
```

### Installation

Run `pre-commit install` after adding the credo hook to your pre-commit config file.

# References
- [Pre-commit](https://pre-commit.com/#intro)
- [Credo](https://github.com/rrrene/credo)
