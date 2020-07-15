# hsmt


黑苹果三码导入/导出工具，方便维护自己的三码信息。 <br>
Hackintosh SMBIOS import/export tool. Convenient to maintain your SMBIOS info.<br>
<br>
命令行工具，需要在终端里敲命令执行，风格比较Linux，需配合输入输出重定向使用，也方便通过管道联合其它应用进行复杂处理<br>
<br>
USAGE: hsmt -e|i|c|s|h [/Path/to/file]<br>
<br>
 /Path/to/file		指定配置文件的位置和文件名，默认为当前目录下的config.plist。<br>
			Specify the location and file name of the configuration file, the default is config.plist in the current directory.<br>
<br>
 -e			导出配置文件中的三码到标准输出，可输出重定向到备份文件或管道给其他程序继续处理。<br>
  -export		The SMBIOS info in the configuration file are exported to standard output, and the output can be redirected to a backup file.<br>
  --export		Example: hsmt -e > ~/Desktop/hsm.plist<br>
  export		Example: hsmt export /Volume/UDISK/EFI/OC/config.plist > hsm.plist<br>
<br>
 -i			导入之前保存的三码信息到配置文件，需要输入重定向或者管道输入。<br>
  -import		Importing the SMBIOS info saved before to the configuration file, requires input redirection or pipeline input.<br>
  --import		Example: hsmt -i < ~/Desktop/hsm.plist<br>
  import		Example: cat hsm.plist | hsmt import /Volume/UDISK/EFI/OC/config.plist<br>
<br>
 -c			清理配置文件中的三码信息，建议分享EFI前先执行本操作。(当前仅支持OC的配置文件，clover支持请留意后续版本更新)<br>
  -clean		To clean up the SMBIOS info in the configuration file, it's recommended to perform this operation before sharing your EFI. (Currently OC only)<br>
  --clean		Example: hsmt -c<br>
  clean			Example: hsmt clean /Volume/UDISK/EFI/OC/config.plist<br>
<br>
 -s			以直观方式显示配置文件/备份文件中的三码。<br>
  -show			Visually display the SMBIOS info in the configuration/backup file.<br>
  --show		Example: hsmt -s<br>
  show			Example: hsmt show /Volume/UDISK/EFI/OC/config.plist<br>
<br>
 -h			显示帮助信息。<br>
  -help			Display this help information.<br>
  --help		Example: hsmt -h<br>
  help			Example: hsmt help<br>
<br>

---

## 常见用法：<br>
<br>
使用前，需要先挂载启动分区到挂载点，通常是/Volumes/EFI，请根据实际情况填写，例如我的U盘的挂载点/Volumes/UDISK<br>
<br>
备份：hsmt -e /Volumes/EFI/EFI/OC/config.plist > ~/Desktop/bak.plist<br>
查看备份：hsmt -s ~/Desktop/bak.plist<br>
恢复：hsmt -i /Volumes/EFI/EFI/OC/config.plist < ~/Desktop/bak.plist<br>
查看恢复：hsmt -s /Volumes/EFI/EFI/OC/config.plist<br>
<br>
备份出的文件放在桌面上，文件名"bak.plist"，请妥善保存。<br>

