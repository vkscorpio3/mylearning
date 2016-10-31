# Git 环境配置


```
warning: push.default is unset;

git config --global push.default matching

git config --global push.default simple

```

### Matching

> ‘matching’ 参数是 Git 1.x 的默认行为，其意是如果你执行 git push 但没有指定分支，它将 push 所有你本地的分支到远程仓库中对应匹配的分支。

### Simple

> 而 Git 2.x 默认的是 simple，意味着执行 git push 没有指定分支时，只有当前分支会被 push 到你使用 git pull 获取的代码。
