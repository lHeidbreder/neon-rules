git pull;
git branch | grep -e '^[^*]' | while read br; do git merge $br; done