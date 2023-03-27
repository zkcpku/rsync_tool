### 本地
```
sh main.sh config/test/from2to
```


### ssh
```
sh main_ssh.sh config\from_langchao\pycodegpt-edit_from_langchao
```

### FQA
1. 如果报错
```
rsync: link_stat "/home/zhangkechi/workspace/dependencyAug/hf_lm/\#015" failed: No such file or directory (2)
```
请注意config文件中用LF换行，不要用CRLF换行