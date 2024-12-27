## 排除README.md，统计文件数量
find . -type f -name "*.md" ! -name "README.md" | wc -l
## 排除README.md，查找不包含notecardId的文件
find . -type f -name "*.md" ! -name "README.md" -exec grep -L "notecardId" {} \;
