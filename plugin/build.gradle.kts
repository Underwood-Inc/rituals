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
    maven("https://repo.papermc.io/repository/maven-public/")
    maven("https://jitpack.io")
    maven("https://repo.extendedclip.com/content/repositories/placeholderapi/")
}

dependencies {
    compileOnly("io.papermc.paper:paper-api:${property("paper_api_version")}")
    compileOnly("org.jetbrains:annotations:26.0.2")
    compileOnly("com.github.MilkBowl:VaultAPI:1.7.1")
    compileOnly("me.clip:placeholderapi:2.11.6")
}

tasks.register<Copy>("syncDatapackZip") {
    description = "Copy packaged datapack zip into plugin resources for the JAR"
    dependsOn(rootProject.tasks.named("packageDatapack"))
    duplicatesStrategy = DuplicatesStrategy.INCLUDE
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
    duplicatesStrategy = DuplicatesStrategy.INCLUDE
    from(rootProject.layout.buildDirectory.dir("datapacks")) {
        include("rituals-datapack-*.zip")
        rename { "rituals.zip" }
    }
    into(rootProject.layout.buildDirectory.dir("server-deploy/world/datapacks"))
}

tasks.register<Copy>("copyPluginToDeploy") {
    description = "Copy plugin JAR into server-deploy bundle"
    dependsOn(tasks.named("jar"))
    doFirst {
        val pluginsDir = rootProject.layout.buildDirectory.dir("server-deploy/plugins").get().asFile
        if (pluginsDir.isDirectory) {
            pluginsDir.listFiles { file ->
                file.isFile && file.name.startsWith("rituals-plugin-") && file.name.endsWith(".jar")
            }?.forEach { it.delete() }
        }
    }
    from(tasks.named<Jar>("jar").get().archiveFile)
    into(rootProject.layout.buildDirectory.dir("server-deploy/plugins"))
}

tasks.register<Copy>("stageServerResourcePack") {
    description = "Copy Rituals-ResourcePack.zip for manual deploy to resourcepacks/"
    dependsOn(rootProject.tasks.named("packageResourcePack"))
    from(rootProject.layout.buildDirectory.dir("resourcepacks")) {
        include("rituals-resourcepack-${rootProject.version}.zip")
        rename { "Rituals-ResourcePack.zip" }
    }
    into(rootProject.layout.buildDirectory.dir("server-deploy/resourcepacks"))
}

tasks.register("assembleServerDeploy") {
    description = "Plugin JAR + world/datapacks/rituals.zip + totem resource pack"
    dependsOn(
        tasks.named("stageServerDatapack"),
        tasks.named("stageServerResourcePack"),
        tasks.named("copyPluginToDeploy")
    )
}
