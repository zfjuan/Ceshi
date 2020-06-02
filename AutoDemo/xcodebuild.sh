#
#脚本所在的目录必须和WorkSpace或者说工程主目录所在的目录在同一个目录层级中
#脚本所在的目录必须和WorkSpace或者说工程主目录所在的目录在同一个目录层级中

#配置参数
#workspace的名字，如果没有则不需要，如果需要用的话，还需要在编译阶段的脚本代码里加上 -workspace ${Project_Name}.xcworkspace
Workspace_Name="AutoDemo"

#工程名字
Project_Name="AutoDemo"

#配置打包方式Release或者Debug
Configuration="Release"

#基础主路径
BUILD_PATH=./build

echo $BUILD_PATH
#工程地址
#project_path='/Users/fjzheng/Documents/Demo/自动化打包/zidonghua'
project_path='.'
#基础子路径
#enterprise
ENTERPRISE_PATH=${BUILD_PATH}/${Project_Name}/enterprise

#31个图标启动图等存放位置 里面是app名字的文件夹 文件夹里放图标 启动图 和额外替换的图
#注意工程中的icon 使用Images.xcassets/AppIcon.appiconset
#launch使用Images.xcassets/LaunchImage.launchimage
#测试使用图标icon
#resource_path=./图标/bailu
#正式使用图标icon
resource_path=./图标/icon
echo $resource_path

#配置编译文件的存放地址
#企业
CONFIGURATION_BUILD_PATH_ENTERPRISE=${ENTERPRISE_PATH}/${Configuration}-iphoneos

#配置打包结果输出的路径
#企业版本
EnterprisePrijectOutPath=${ENTERPRISE_PATH}/enterpriseOut

#如果工程中配置了Automatically manage signing，那么就不需要证书名和描述文件名，请确保工程中配置的证书名和描述文件是你打包想要用的
#企业(enterprise)证书名#描述文件
#ENTERPRISECODE_SIGN_IDENTITY="iPhone Distribution: China United Communications Network Ltd SH Branch"
#ENTERPRISEROVISIONING_PROFILE_NAME="3b169afc-9547-4715-ae82-c6c033996522"

#加载各个版本的plist文件，为了实现一个脚本打包所有版本，这里对不同对版本创建了不同的plist配置文件。等号后面是文件路径，一般把plist文件放在与脚本同一级别的文件层中。我这里测试用所以plist文件都一样，实际使用是请分开配置为不同文件
EnterpriseExportOptionsPlist="./ExportOptions.plist"


#首先清除原来的文件夹
rm -rf ${BUILD_PATH}
#创建文件夹，路径需要一层一层创建，不然会创建失败
mkdir ${BUILD_PATH}
mkdir ${ENTERPRISE_PATH}
#编译文件
mkdir ${CONFIGURATION_BUILD_PATH_ENTERPRISE}
#打包输出的文件
mkdir ${EnterprisePrijectOutPath}
#copy
mkdir ${DSYM_COPY_PATH_ENTERPRISE}


#---------------------------------------------------------------------------------------------------------------------------------



xcodebuild clean -workspace ${Project_Name}.xcworkspace -scheme ${Project_Name} -configuration $Configuration

xcodebuild archive -workspace ${Project_Name}.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath ${ENTERPRISE_PATH}/$Project_Name-enterprise.xcarchive

#xcodebuild archive -workspace ${Project_Name}.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath ${ENTERPRISE_PATH}/$Project_Name-enterprise.xcarchive
#CODE_SIGN_IDENTITY="${ENTERPRISECODE_SIGN_IDENTITY}" PROVISIONING_PROFILE="${ENTERPRISEROVISIONING_PROFILE_NAME}" PRODUCT_BUNDLE_IDENTIFIER=${bundleId}

xcodebuild -exportArchive -archivePath ${ENTERPRISE_PATH}/$Project_Name-enterprise.xcarchive -exportOptionsPlist $EnterpriseExportOptionsPlist -exportPath ${EnterprisePrijectOutPath}



