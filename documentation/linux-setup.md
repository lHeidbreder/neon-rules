# Setup under Linux
Since MiKTeX under Windows makes compiling this project much easier,
this is how to set it up using TeXLive under Linux.
## Dependencies
Install **TeXLive** (package `texlive-base`) and get that running.
Then install **texliveonfly** (`tlmgr install texliveonfly`) and **latexmk** (package `latexmk`).  
Obviously you need **Git**, as well as **Git LFS**.  
To execute prep scripts you will need **Python 3.12** (though any Python 3 may just do).

## Execution
Clone the project and change into its folder.  
Run `./scripts/compileall.sh` to run all preparation scripts.
> This will show compilation errors, which is alright.
If it does not, you are already done here.

Now, to download all dependencies, run
`cd character-sheet && latexmk -pdflua -interaction=nonstopmode character-sheet.tex`  
Return to the base directory and run the compile script again and the errors should be gone:
`cd .. && ./scripts/compileall.sh`
