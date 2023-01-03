job "php" {

    datacenters = ["dc1"]

    group "php" {
        count = 1
        network {
            port "php" {
                static = 8080
                to = 80
            }
        }    

        task "php" {
            driver = "docker"
            config {
                image = "php:7.2-apache"
                ports = [ "php" ]
            }

            resources {
                cpu = 250
                memory = 256
            }
        }
    }
}