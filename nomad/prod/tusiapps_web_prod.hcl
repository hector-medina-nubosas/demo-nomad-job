job "turisapps_web_prod" {
    
    meta {
        run_uuid = "${uuidv4()}"
    }

    datacenters = ["dc1"]

    group "turisapps_web_prod" {
        count = 1
        network {
            port "turisapps_web_prod" {
                static = 8080
                to = 80
            }
        }    

        task "turisapps_web_prod" {
            driver = "docker"
            config {
                image = "hectormedinanubosas/demo-nomad-job:prod_latest"
                ports = [ "turisapps_web_prod" ]
                force_pull = true
            }

            resources {
                cpu = 250
                memory = 256
            }
        }
    }
}