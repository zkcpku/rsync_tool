# 用于同步下载服务器上的代码，会压缩成zip，并过滤掉指定的大文件等内容
rsync -av \
    --exclude='save_openrlhf*/' \
    --exclude='wandb/' \
    --exclude="checkpoint/" \
    --exclude="ckpt/" \
    --exclude="openrlhf.egg-info/" \
    --exclude="Qwen2.5-Math-7B-Instruct/" \
    --exclude="Qwen2.5-14B-Instruct/" \
    --exclude="*.log" \
    --exclude="dataset" \
    /mnt/bd/arxivdata/openrlhf/ /mnt/bd/arxivdata/openrlhf_backup/

du -sh /mnt/bd/arxivdata/openrlhf_backup/
zip -r /mnt/bd/arxivdata/openrlhf_backup.zip /mnt/bd/arxivdata/openrlhf_backup/
