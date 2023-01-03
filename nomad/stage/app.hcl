job "php" {

    datacenters = ["dc1"]
    group "php" {
        count = 1
        network {
            port "phpport"{
                static = 8080
                to = 80
            }
        }    

        task "php" {
            driver = "docker"
            config {
                image = "php:7.2-apache"
                ports = [ "phpport" ]
            }

            resources {
                cpu = 250
                memory = 256
            }
        }
    }
}