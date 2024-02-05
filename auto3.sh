make download -j$(nproc)
find dl -size -1024c -exec ls -l {} \;
find dl -size -1024c -exec rm -f {} \;
echo -e "$(nproc) thread build."
make -j$(nproc) V=s
