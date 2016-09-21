# Git 配置

## 配置全局的 user.name & user.email
```
git config --global user.name "xxx"
git config --global user.email "xxxx@xxx.com"
```

## 去掉--global参数，为当前仓库配置 user.name & user.email
```
git config user.name "xxx"  
git config user.email "xxxx@xxx.com"
```

## push.default
```
git config --global push.default "current"
```

* nothing – do not push anything.
* matching – push all branches having the same name in both ends. This is for those who prepare all the branches into a publishable shape and then push them out with a single command. It is not appropriate for pushing into a repository shared by multiple users, since locally stalled branches will attempt a non-fast forward push if other users updated the branch.
This is currently the default, but Git 2.0 will change the default to simple.
* upstream – push the current branch to its upstream branch. With this, git push will update the same remote ref as the one which is merged by git pull, making push and pull symmetrical. See “branch.<name>.merge” for how to configure the upstream branch.
* simple – like upstream, but refuses to push if the upstream branch’s name is different from the local one. This is the safest option and is well-suited for beginners. It will become the default in Git 2.0.
* current – push the current branch to a branch of the same name.
