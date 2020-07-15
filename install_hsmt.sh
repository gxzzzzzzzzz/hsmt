
touch /usr/local/bin/hsmt
[ $? -ne 0 ] && echo "尝试保存文件到/usr/local/bin/hsmt出错，请检查权限设置，或者使用sudo指令重新运行安装脚本。" && exit 1

curl https://raw.githubusercontent.com/gxzzzzzzzzz/hsmt/master/hsmt > /usr/local/bin/hsmt
[ $? -ne 0 ] && echo "从github获取 hsmt 出错，请检查网络连接是否正常或者多试几次。" && exit 1

chmod +x /usr/local/bin/hsmt
[ $? -ne 0 ] && echo "为/usr/local/bin/hsmt添加可执行权限时出错，请检查权限设置，或者使用sudo指令重新运行安装脚本。" && exit 1

hsmt &> /dev/null
[ $? -ne 0 ] && echo "尝试执行 hsmt 时出错，请检查权限设置，或者使用sudo指令重新运行安装" && exit 1

echo ""
echo "hsmt 安装成功。"
echo ""

exit 0

