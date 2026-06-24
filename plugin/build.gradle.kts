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

tasks.register<Copy>("syncDatapackZip") {
    description = "Copy packaged datapack zip into plugin resources for the JAR"
    dependsOn(rootProject.tasks.named("packageDatapack"))
    from(rootProject.layout.buildDirectory.dir("datapacks")) {
        include("rituals-datapack-*.zip")
        rename { "rituals-datapack.zip" }
    }
    into(layout.buildDirectory.dir("generated/datapack"))
}

tasks.processResources {
    dependsOn("syncDatapackZip")
    from(layout.buildDirectory.dir("generated/datapack"))
    val props = mapOf("version" to project.version)
    inputs.properties(props)
    filesMatching("plugin.yml") {
        expand(props)
    }
}

tasks.jar {
    archiveBaseName.set("rituals-plugin")

    manifest {
        attributes(
            "Premain-Class" to "com.rituals.plugin.datapack.DatapackInstallAgent",
            "Can-Redefine-Classes" to "false",
            "Can-Retransform-Classes" to "false"
        )
    }

    from(rootProject.file("LICENSE")) {
        rename { "LICENSE_${archiveBaseName.get()}" }
    }
}

tasks.register<Copy>("stageServerDatapack") {
    description = "Copy rituals.zip for manual deploy to world/datapacks/ (crash-loop recovery)"
    dependsOn(rootProject.tasks.named("packageDatapack"))
    from(rootProject.layout.buildDirectory.dir("datapacks")) {
        include("rituals-datapack-*.zip")
        rename { "rituals.zip" }
    }
    into(rootProject.layout.buildDirectory.dir("server-deploy/world/datapacks"))
}

tasks.register<Copy>("copyPluginToDeploy") {
    description = "Copy plugin JAR into server-deploy bundle"
    dependsOn(tasks.named("jar"))
    from(tasks.named<Jar>("jar").get().archiveFile)
    into(rootProject.layout.buildDirectory.dir("server-deploy/plugins"))
}

tasks.register("assembleServerDeploy") {
    description = "Plugin JAR + world/datapacks/rituals.zip for upload while server is stopped"
    dependsOn(tasks.named("stageServerDatapack"), tasks.named("copyPluginToDeploy"))
}
