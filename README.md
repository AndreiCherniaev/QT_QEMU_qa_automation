# qa-automation
Make buildroot i586 distro, run on QEMU. Compiling Qt, cross-compiling Qt, deploy Qthelloworld

# Clone
Simple way
```
git clone --remote-submodules --recurse-submodules -j8 https://github.com/AndreiCherniaev/QT_QEMU_qa_automation.git
```
Or several-steps way
```
git clone  https://github.com/AndreiCherniaev/QT_QEMU_qa_automation.git
cd QT_QEMU_qa_automation/
git submodule update --remote --merge
```

## Warnings
More information about [qa automation](https://habr.com/ru/post/520310/).  
Please [install](https://habr.com/ru/articles/735754/) all packages what your distro needs to run QEMU.  
Please install all packages what your distro needs to build Qt (see https://wiki.qt.io/Building_Qt_6_from_Git ).  
This steps use 5555 port for ssh communication. If you want, you can replace 5555 to any.  
This steps use buildroot mirror on github because of fast downloading from github. But you can use `git clone git://git.buildroot.net/buildroot`  
Buildroot is submodule which is added this way
```
git submodule add -b master https://github.com/buildroot/buildroot
```
This steps use Qt mirror on github because of fast downloading from github. But you can use `git clone git://code.qt.io/qt/qt5.git qt5`  

## Before start
Check that you are in dir QT_QEMU_qa_automation/
```
MyBaseDir=$PWD && MyQtBaseDir="$MyBaseDir/Qt_themself"
```

Check variable
```
cd ~ && cd "$MyBaseDir"
```

## Make ssh key
This code Overwrite ssh with "yes"
```
mkdir -p "$MyBaseDir/myBuildroot/my_external_tree/board/my_company/my_board/qemu_ssh_key" && ssh-keygen -f "$MyBaseDir/myBuildroot/my_external_tree/board/my_company/my_board/qemu_ssh_key/my_qemu_ssh_key" -N "" -C myKeyForQemu <<< $'\ny' >/dev/null 2>&1
```
Copy pub key to QEMU image
```
mkdir -p "$MyBaseDir/myBuildroot/my_external_tree/board/my_company/my_board/fs-overlay/root/.ssh" && cat "$MyBaseDir/myBuildroot/my_external_tree/board/my_company/my_board/qemu_ssh_key/my_qemu_ssh_key.pub" >> "$MyBaseDir/myBuildroot/my_external_tree/board/my_company/my_board/fs-overlay/root/.ssh/authorized_keys"
```

## Make target OS image
Time to make target operation system. I use Buildroot to make new Linux-based operation system. My config qemu_x86_ssh_defconfig is based on standart buildroot's config [qemu_x86_defconfig](https://github.com/buildroot/buildroot/blob/c0799123742eb9b60ca109c0ea0cb1728c22bf0a/configs/qemu_x86_defconfig)
```
make clean -C "$MyBaseDir/myBuildroot/buildroot"
make BR2_EXTERNAL="$MyBaseDir/myBuildroot/my_external_tree" -C "$MyBaseDir/myBuildroot/buildroot" qemu_x86_ssh_defconfig
make -C "$MyBaseDir/myBuildroot/buildroot"
```

## Prepare Qt
Qt themself located in his folder
```
cd "$MyQtBaseDir"
```

Qt's folders must be clear: remove and create its again
```
rm -Rf ${MyQtBaseDir}/build_host/ ${MyQtBaseDir}/build_artifacts_host/ && mkdir ${MyQtBaseDir}/build_host ${MyQtBaseDir}/build_artifacts_host
rm -Rf ${MyQtBaseDir}/build_cross/ ${MyQtBaseDir}/build_artifacts_cross/ && mkdir ${MyQtBaseDir}/build_cross ${MyQtBaseDir}/build_artifacts_cross
```

If you want test another Qr version do 
```
rm -Rf ${MyQtBaseDir}/qt5/
```
Let's clone Qt
```
git clone https://github.com/qt/qt5 qt5 && cd qt5
git checkout 6.4.2
perl init-repository --module-subset=qtbase
```

Let's configure Qt for for host (laptop)
```
cd "$MyQtBaseDir/build_host"
../qt5/configure -release -static -opensource -nomake examples -nomake tests -confirm-license -no-pch -no-xcb -no-xcb-xlib -no-gtk -skip webengine -skip qtwayland -skip qtdoc -skip qtgraphicaleffects -skip qtqa -skip qttranslations -skip qtvirtualkeyboard -skip qtquicktimeline -skip qtquick3d -skip qt3d -skip qtrepotools -skip qttools -skip qtimageformats -skip qtnetworkauth -skip qtwebsockets -skip qtactiveqt -skip qtmacextras -skip winextras -skip qtmultimedia -skip qtgamepad -skip qtserialbus -skip qtspeech -skip qtsensors -skip qtcharts -skip qtlocation -no-ssl -platform linux-g++-32 -prefix ../build_artifacts_host -- -DCMAKE_TOOLCHAIN_FILE=../toolchain_host.cmake
cmake --build . --parallel &&
cmake --install .
```

Let's configure Qt for for target (on-board computer)
```
cd "$MyQtBaseDir/build_cross/"
../qt5/configure -platform linux-g++-32 -- -GNinja -DCMAKE_BUILD_TYPE=Release -DQT_BUILD_EXAMPLES=OFF -DQT_BUILD_TESTS=OFF -DCMAKE_STAGING_PREFIX=${PWD}/../build_artifacts_cross -DCMAKE_TOOLCHAIN_FILE=../toolchain_cross.cmake
cmake --build . --parallel &&
cmake --install .
```

Back to MyQtBaseDir (QT_QEMU_qa_automation)
```
cd "$MyQtBaseDir"
```

Prepare folder to build test Qt hello world application
```
rm -Rf "$MyQtBaseDir/test_qt_helloworld/build-test_qt_helloworld/"
mkdir -p "$MyQtBaseDir/test_qt_helloworld/build-test_qt_helloworld"
```
Build Qt hello world application
```
"$MyQtBaseDir/build_artifacts_cross/bin/qt-cmake" -S "$MyBaseDir/progs/test_qt_helloworld" -B "$MyBaseDir/progs/test_qt_helloworld/build-test_qt_helloworld" -DCMAKE_BUILD_TYPE=Release
cmake --build "$MyBaseDir/progs/test_qt_helloworld/build-test_qt_helloworld/" --parallel
```
Now we have executable file progs/test_qt_helloworld/build-test_qt_helloworld/test and see "qt_helloworld"

## Run QEMU
I use -cpu pentium3 to set no-sse2 machine. Please use Second console for it. Run from MyQtBaseDir folder
```
qemu-system-i386 -M pc -cpu pentium3 -kernel "$MyBaseDir/myBuildroot/buildroot/output/images/bzImage" -drive file="$MyBaseDir/myBuildroot/buildroot/output/images/rootfs.ext2",if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0"  -nographic -net nic,model=virtio -net user,hostfwd=tcp::5555-:22
```

## Upload Qt hello world 
to qemu machine to folder /root
```
options=(-rvz -e "ssh -p 5555 -i "$MyBaseDir/myBuildroot/my_external_tree/board/my_company/my_board/qemu_ssh_key/my_qemu_ssh_key" -o StrictHostKeyChecking=no" --progress)
rsync "${options[@]}" "$MyBaseDir/progs/test_qt_helloworld/build-test_qt_helloworld/test" root@localhost:/root/
```

To connect be at MyBaseDir (QT_QEMU_qa_automation/) folder and use
```
ssh root@localhost -p 5555 -i "$MyBaseDir/myBuildroot/my_external_tree/board/my_company/my_board/qemu_ssh_key/my_qemu_ssh_key" -o StrictHostKeyChecking=no
```

Now we can run app on qemu (!) machine (after ssh login)
```
./test
```
