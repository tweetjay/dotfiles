function setAndroidPaths --description 'Detect and set Android paths'
    set -l androidSdkVersion (ls /usr/local/Cellar/android-sdk | sort -r | awk 'NR==1{print $1}')
    set -l androidNdkVersion (ls /usr/local/Cellar/android-ndk | sort -r | awk 'NR==1{print $1}')
    set -l androidBuildToolsVersion (ls /usr/local/Cellar/android-sdk/$androidSdkVersion/build-tools/ | sort -r | awk 'NR==1{print $1}')
    echo "using android sdk version $androidSdkVersion"
    echo "using android ndk version $androidNdkVersion"
    echo "using android build tools version $androidBuildToolsVersion"

    set -x ANDROID_HOME /usr/local/Cellar/android-sdk/$androidSdkVersion
    set -x NDK_HOME /usr/local/Cellar/android-ndk/$androidNdkVersion
    set -U fish_user_paths $fish_user_paths /usr/local/Cellar/android-sdk/$androidSdkVersion/bin
    set -U fish_user_paths $fish_user_paths /usr/local/Cellar/android-sdk/$androidSdkVersion/tools
    set -U fish_user_paths $fish_user_paths /usr/local/Cellar/android-sdk/$androidSdkVersion/platform-tools
    set -U fish_user_paths $fish_user_paths /usr/local/Cellar/android-sdk/$androidSdkVersion/build-tools/$androidBuildToolsVersion
    set -U fish_user_paths $fish_user_paths /usr/local/Cellar/android-ndk/$androidNdkVersion
end
