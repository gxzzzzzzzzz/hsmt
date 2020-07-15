# hsmt

黑苹果三码导入/导出工具，方便维护自己的三码信息。 <br>
Hackintosh SMBIOS import/export tool. Convenient to maintain your SMBIOS info.<br>
<br>
命令行工具，需要在终端里敲命令执行，风格比较Linux，需配合输入输出重定向使用，也方便通过管道联合其它应用进行复杂处理<br>
<br>
USAGE: hsmt -e|i|c|s|h [/Path/to/file]<br>
<br>

 |参数|说明|
 |:---|:---|
 |/Path/to/file<br>|指定配置文件的位置和文件名，默认为当前目录下的config.plist。<br>Specify the location and file name of the configuration file, the default is config.plist in the current directory.|
 |-e<br>-export<br>--export<br>export<br>|导出配置文件中的三码到标准输出，可输出重定向到备份文件或管道给其他程序继续处理。<br>The SMBIOS info in the configuration file are exported to standard output, and the output can be redirected to a backup file.<br>Example: hsmt -e > ~/Desktop/hsm.plist<br>Example: hsmt export /Volumes/UDISK/EFI/OC/config.plist > hsm.plist|
 |-i<br>-import<br>--import<br>import<br>|导入之前保存的三码信息到配置文件，需要输入重定向或者管道输入。Importing the SMBIOS info saved before to the configuration file, requires input redirection or pipeline input.<br>Example: hsmt -i < ~/Desktop/hsm.plist<br>Example: cat hsm.plist | hsmt import /Volumes/UDISK/EFI/OC/config.plist|
 |-c<br>-clean<br>--clean<br>clean<br>|清理配置文件中的三码信息，建议分享EFI前先执行本操作。(当前仅支持OC的配置文件，clover支持请留意后续版本更新)<br>To clean up the SMBIOS info in the configuration file, it's recommended to perform this operation before sharing your EFI. (Currently OC only)<br>Example: hsmt -c<br>Example: hsmt clean /Volumes/UDISK/EFI/OC/config.plist|
 |-s<br>-show<br>--show<br>show<br>|以直观方式显示配置文件/备份文件中的三码。<br>Visually display the SMBIOS info in the configuration/backup file.<br>Example: hsmt -s<br>Example: hsmt show /Volumes/UDISK/EFI/OC/config.plist|
 |-h<br>-help<br>--help<br>help<br>|显示帮助信息。<br>Display this help information.<br>Example: hsmt -h<br>Example: hsmt help|

---

## 安装方法：<br>
打开一个终端窗口，输入下面一行指令：<br> 
bash <(curl -L https://raw.githubusercontent.com/gxzzzzzzzzz/hsmt/master/install_hsmt.sh)<br>
如果报错，提示需要sudo，则执行下面的指令：<br>
sudo bash <(curl -L https://raw.githubusercontent.com/gxzzzzzzzzz/hsmt/master/install_hsmt.sh)<br>
自动化脚本将帮助您完成hsmt工具的安装。<br>

---

## 常见用法：<br>
使用前，需要先挂载启动分区到挂载点，通常是/Volumes/EFI，请根据实际情况填写，例如我的U盘的挂载点是/Volumes/UDISK<br>
配置文件位于【挂载点】/EFI/OC/config.plist，所以完整路径通常是/Volumes/EFI/EFI/OC/config.plist<br>
下面的命令以此路径为例，请自行替换使用。<br>
<br>

 |功能|命令行|
 |:---|:---|
 |备份|hsmt -e /Volumes/EFI/EFI/OC/config.plist > ~/Desktop/bak.plist|
 |查看备份|hsmt -s ~/Desktop/bak.plist|
 |恢复|hsmt -i /Volumes/EFI/EFI/OC/config.plist < ~/Desktop/bak.plist|
 |查看恢复结果|hsmt -s /Volumes/EFI/EFI/OC/config.plist|

备份出的文件放在桌面上，文件名"bak.plist"，请妥善保存。<br>
