plugins {
    java
}

group = "com.rituals"
version = rootProject.version

java {
    toolchain.languageVersion.set(JavaLanguageVersion.of(25))
}

repositories {
    mavenCentral()
    maven("https://hub.spigotmc.org/nexus/content/repositories/snapshots/")
    maven("https://jitpack.io")
    maven("https://repo.extendedclip.com/content/repositories/placeholderapi/")
}

dependencies {
    compileOnly("org.spigotmc:spigot-api:${property("spigot_api_version")}")
    compileOnly("org.jetbrains:annotations:26.0.2")
    compileOnly("com.github.MilkBowl:VaultAPI:1.7.1")
    compileOnly("me.clip:placeholderapi:2.11.6")
}

tasks.processResources {
    val props = mapOf("version" to project.version)
    inputs.properties(props)
    filesMatching("plugin.yml") {
        expand(props)
    }
}

tasks.jar {
    dependsOn(rootProject.tasks.named("packageDatapack"))
    archiveBaseName.set("rituals-plugin")

    from(rootProject.layout.buildDirectory.dir("datapacks")) {
        include("rituals-datapack-*.zip")
        rename { "rituals-datapack.zip" }
    }

    from(rootProject.file("LICENSE")) {
        rename { "LICENSE_${archiveBaseName.get()}" }
    }
}
