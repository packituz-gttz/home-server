resource "grafana_rule_group" "docker_alerts" {

  folder_uid         = grafana_folder.docker_alerts_folder.uid
  name               = "Docker Status"
  org_id             = grafana_organization.main_org.id
  disable_provenance = true
  interval_seconds   = 60

  rule {
    name           = "Jellyfin Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Alerting"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Jellyfin down",
      "description" : "Jellyfin docker service is down"
    }
    is_paused = false
    data {
      ref_id     = "A"
      query_type = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = grafana_data_source.prometheus.uid
      model          = file("${path.module}/alerts_files/jellyfin_status_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/docker_service_status_B.json")
    }
  }

  rule {
    name           = "Jump Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Alerting"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Jump down",
      "description" : "Jump docker service is down"
    }
    is_paused = false
    data {
      ref_id     = "A"
      query_type = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = grafana_data_source.prometheus.uid
      model          = file("${path.module}/alerts_files/jump_status_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/docker_service_status_B.json")
    }
  }

  rule {
    name           = "Cloudflare Tunnels Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Alerting"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Cloudflare Tunnels down",
      "description" : "Cloudflare Tunnels docker service is down"
    }
    is_paused = false
    data {
      ref_id     = "A"
      query_type = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = grafana_data_source.prometheus.uid
      model          = file("${path.module}/alerts_files/cloudflare_tunnels_status_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/docker_service_status_B.json")
    }
  }

  rule {
    name           = "Navidrome Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Alerting"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Navidrome down",
      "description" : "Navidrome docker service is down"
    }
    is_paused = false
    data {
      ref_id     = "A"
      query_type = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = grafana_data_source.prometheus.uid
      model          = file("${path.module}/alerts_files/navidrome_status_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/docker_service_status_B.json")
    }
  }

  rule {
    name           = "Kavita Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Alerting"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Kavita down",
      "description" : "Kavita docker service is down"
    }
    is_paused = false
    data {
      ref_id     = "A"
      query_type = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = grafana_data_source.prometheus.uid
      model          = file("${path.module}/alerts_files/kavita_status_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/docker_service_status_B.json")
    }
  }


}