--see https://habr.com/ru/post/520310/ --


# cd /home/a/QtFromGit/myb/
# git clone git://git.buildroot.net/buildroot 

#!check that you are in QT_QEMU_qa_automation/ dir!

make clean -C buildroot
make BR2_EXTERNAL=$PWD/my_external_tree -C buildroot qemu_x86_ssh_defconfig #baseon qemu_x86_defconfig 
make -C buildroot

# PREPARE QT
git clone https://github.com/qt/qt5 qt5
cd qt5
git checkout 6.4.2
perl init-repository –module-subset=qtbase,qtserialport
cd ../build_host

rm -R * #be careful
../qt5/configure -release -static -opensource -nomake examples -nomake tests -confirm-license -no-pch -no-xcb -no-xcb-xlib -no-gtk -skip webengine -skip qtwayland -skip qtdoc -skip qtgraphicaleffects -skip qtqa -skip qttranslations -skip qtvirtualkeyboard -skip qtquicktimeline -skip qtquick3d -skip qt3d -skip qtrepotools -skip qttools -skip qtimageformats -skip qtnetworkauth -skip qtwebsockets -skip qtactiveqt -skip qtmacextras -skip winextras -skip qtmultimedia -skip qtgamepad -skip qtserialbus -skip qtspeech -skip qtsensors -skip qtcharts -skip qtlocation -no-ssl -platform linux-g++-32 -prefix ../build_artifacts_host -- -DCMAKE_TOOLCHAIN_FILE=../toolchain_host.cmake
cmake --build . --parallel
cmake --install .

cd ../build_cross/

../qt5/configure -platform linux-g++-32 -- -GNinja -DCMAKE_BUILD_TYPE=Release -DQT_BUILD_EXAMPLES=OFF -DQT_BUILD_TESTS=OFF -DCMAKE_STAGING_PREFIX=/home/a/QtFromGit/build_artifacts_cross -DCMAKE_TOOLCHAIN_FILE=../toolchain_cross_full2.cmake -S ../qt5
--AUTO--


--RUN--
https://wiki.qemu.org/Documentation/Networking#The_legacy_-net_option
https://fadeevab.com/how-to-setup-qemu-output-to-console-and-automate-using-shell-script/

cd /home/a/QtFromGit/myb/ &&
qemu-system-i386 -M pc -kernel buildroot/output/images/bzImage -drive file=buildroot/output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0"  -nographic -net nic,model=virtio -net user,hostfwd=tcp::5555-:22 




ssh-keygen -f "/home/a/.ssh/known_hosts" -R "[localhost]:5555" && ssh root@localhost -p 5555
ssh root@localhost -p 5555


--EXTERNAL TREE--
cd
mkdir my_external_tree &&
cd my_external_tree &&
touch Config.in external.mk external.desc &&
mkdir configs package patches -p board/my_company/my_board
#add overlay to ssh key fs-overlay  mkdir -p board/my_company/my_board/fs-overlay/root/.ssh




--SSH KEY GENERATION AND DEPLOYING--
cd ~/QtFromGit/myb/my_external_tree/board/my_company/my_board/fs-overlay/root/.ssh
ssh-keygen -f qemu_ssh_key -N ""
rsync -rvz -e 'ssh -p 5555' --progress /home/a/QtFromGit/myb/my_external_tree/board/my_company/my_board/my1_key/qemu_ssh_key.pub root@localhost:/root/.ssh/ #with end slash - to be folder


--TAKE LOGS FROM virt--
rsync -rvz -e 'ssh -p 5555' --progress root@localhost:/var/log/ /home/a/QtFromGit/myb/logs/

--PUT .pub key on virt--
ssh-copy-id -p 5555 -i my3qemu.pub root@localhost
chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys


--ADD SUBMODULE--
git submodule add https://github.com/qt/qt5
git submodule add --depth 1 https://github.com/qt/qt5
git clone --recurse-submodules -j8 https://github.com/qt/qt5
git rm qtbase

--PREPARE QT--
mkdir build_host build_artifacts_host build_cross build_artifacts_cross



--OLD--
qemu-system-i386 -M pc -kernel buildroot/output/images/bzImage -drive file=buildroot/output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0"  -serial stdio -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5555-:22



--OLD ALLOW SSH--
cat << EOF >> t.txt
PermitRootLogin yes
PermitEmptyPasswords yes
EOF

--OLD--
#works with two windows
qemu-system-i386 -M pc -kernel buildroot/output/images/bzImage -drive file=buildroot/output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -nographic -net nic,model=virtio -net user,hostfwd=tcp::5555-:22 


cd /home/a/QtFromGit/myb/buildroot/output/images/
exec qemu-system-i386 -M pc -kernel bzImage -drive file=rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0"  -serial stdio 
-netdev user,id=net0,hostfwd=tcp::5555-:22

