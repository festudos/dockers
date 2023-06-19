----
**Git Install**
```bash
sudo git init && \
git config --global user.email “fabricio.butt@gmail.com” &&\
git config --global user.name fabriciobuttbutt && \
git config --global init.defaultBranch master && \
ssh -T git@github.com
export GH_TOKEN="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"
printenv | grep GH
```

`gh auth login --with-token < $GH_TOKEN`

```bash
git remote add origin git@github.com:fabriciobuttbutt/dockers.git && \
git status
```

`git pull # --rebase https://github.com/fabriciobuttbutt/Linux_install.git master`

```bash
git branch --show-current && \ # --all --list 
git add -A && \
git log -n 2 && \
git commit  -m "Commit_$(date +"%D")" && \
git log -n 2 && git status
```
`git push -u origin master`

----
**Chave SSH**
````bash
ssh-keygen -t ed25519 -C "fabricio.butt@gmail.com"
ls -al  ~/.ssh && \
ssh-keygen -t ed25519 -C "fabricio.butt@gmail.com" && \ #-N "" -f ~/.ssh/gh-test
eval "$(ssh-agent -s)"	   && \
ssh-add ~/.ssh/id_ed25519  && \
cat ~/.ssh/id_ed25519.pub  && \
ssh -T git@github.com
````
----
