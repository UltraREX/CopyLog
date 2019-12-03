::drive letter  磁盘驱动器号
set DriveLetter=%~d1

::directory path without drive letter  不带驱动器号的文件所在目录
set DirectoryPathWithoutDriveLetter=%~p1

::directory path  带驱动器号的文件所在目录
set DirectoryPath=%~d1%~p1

::file name without extension  不带拓展名的文件名称
set FileNameWithoutExtension=%~n1

::file extension  文件的拓展名
set FileExtension=%~x1

::file name with extension  带拓展名的文件名称
set FileName=%~n1%~x1

::absolute path  文件的绝对路径
set AbsolutePath=%~f1

::file size (bytes)  文件的大小（字节）
set FileSize=%~z1