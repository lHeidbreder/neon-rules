### Install necessary dependencies
You will need Git CLI and Git LFS to clone, a LaTeX package manager (MiKTeX), Python 3 (any version will probably do).
Open PowerShell and run:
```powershell
winget install "Git.Git" "GitHub.GitLFS" "MiKTeX.MiKTeX" "Python.Python.3.12"
```
Open the MiKTeX console and check for updates.

### Clone the code
Open Git Bash at a desired location. Run:
```bash
git clone https://github.com/lHeidbreder/neon-rules.git && cd neon-rules/
```
If GitLFS was not installed at the time of cloning, run:
```bash
git lfs checkout
```

### Compile the code
In Git Bash in _neon-rules_ run:
```bash
./scripts/compileall.sh
```
Allow MiKTeX to download the necessary libraries.
The compiled set will be found in _\_rulepackage/_.