prepare_nakasig() {
  $(gettop)/device/asus/nakasig/build/prepare_nakasig "$@"
}

echo "Create Nakasig images with the following commands:"
echo " $ lunch nakasig-user"
echo " $ prepare_nakasig"
echo " $ make updatepackage > buildlog.log 2>&1"
