# Branch

>

## 命令
```
git branch
```

- git branch 列出本地已经存在的分支，并且在当前分支的前面加星号标记
- git branch -r 列出远程分支
- git branch -a 列出本地分支和远程分支
- git branch newbranch 创建一个新的本地分支，需要注意，此处只是创建分支，不进行分支切换
- git checkout branchname 切换分支
- git branch -m oldbranchname newbranchname 重命名分支，如果newbranch名字分支已经存在，则需要使用-M强制重命名，否则，使用-m进行重命名
- git branch -d branchname 删除branchname分支
- git branch -d -r branchname 删除远程branchname分支
