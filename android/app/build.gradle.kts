import java.io.File
import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// قراءة ملف key.properties من نفس مجلد android/app
val keystoreProperties = Properties()
val keystorePropertiesFile = File(projectDir, "key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
} else {
    throw GradleException("key.properties file not found in ${keystorePropertiesFile.absolutePath}")
}

android {
    namespace = "com.example.smile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.smile.smilecare"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            // التحقق من كل قيمة قبل استخدامها
            val keyAliasValue = keystoreProperties["keyAlias"]?.toString()
                ?: throw GradleException("keyAlias not set in key.properties")
            keyAlias = keyAliasValue

            val keyPasswordValue = keystoreProperties["keyPassword"]?.toString()
                ?: throw GradleException("keyPassword not set in key.properties")
            keyPassword = keyPasswordValue

            val storePasswordValue = keystoreProperties["storePassword"]?.toString()
                ?: throw GradleException("storePassword not set in key.properties")
            storePassword = storePasswordValue

            val storeFilePath = keystoreProperties["storeFile"]?.toString()
                ?: throw GradleException("storeFile not set in key.properties")
            val storeFileAbsolute = File(projectDir, storeFilePath)
            if (!storeFileAbsolute.exists()) {
                throw GradleException("Keystore file not found at ${storeFileAbsolute.absolutePath}")
            }
            storeFile = storeFileAbsolute
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}
