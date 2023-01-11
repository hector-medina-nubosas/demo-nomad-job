job "turisapps_web_stage" {

    meta {
        run_uuid = "${uuidv4()}"
    }
    datacenters = ["dc1"]

    group "turisapps_web_stage" {
        count = 1
        network {
            port "turisapps_web_stage" {
                static = 8081
                to = 80
            }
        }    

        task "turisapps_web_stage" {
            driver = "docker"
            config {
                image = "hectormedinanubosas/demo-nomad-job:stage_latest"
                ports = [ "turisapps_web_stage" ]
                force_pull = true
            }

            resources {
                cpu = 250
                memory = 256
            }
        }
    }
}