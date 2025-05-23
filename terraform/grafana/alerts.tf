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

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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

  rule {
    name           = "Lychee Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Alerting"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Lychee down",
      "description" : "Lychee docker service is down"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/lychee_status_A.json")
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
    name           = "Pingvin Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Alerting"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Pingvin down",
      "description" : "Pingvin docker service is down"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/pingvin_status_A.json")
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

resource "grafana_rule_group" "system_alerts" {
  folder_uid         = grafana_folder.system_alerts_folder.uid
  name               = "System Alerts"
  org_id             = grafana_organization.main_org.id
  disable_provenance = true
  interval_seconds   = 60

  rule {
    name           = "Memory High Usage"
    for            = "5m"
    condition      = "B"
    no_data_state  = "NoData"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Memory usage"
      "description" : "High memory usage"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/high_memory_usage_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/system_alerts_B.json")
    }

  }

  rule {
    name           = "CPU High Usage"
    for            = "5m"
    condition      = "B"
    no_data_state  = "NoData"
    exec_err_state = "Error"
    annotations = {
      "summary" : "CPU usage"
      "description" : "High CPU usage"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/high_cpu_usage_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/system_alerts_cpu_B.json")
    }

  }

  rule {
    name           = "Temperature Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "NoData"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Temperature Status"
      "description" : "Temperature Status"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/high_cpu_usage_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/system_alerts_B.json")
    }

  }

  rule {
    name           = "Root Disk Usage"
    for            = "5m"
    condition      = "B"
    no_data_state  = "NoData"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Root Disk Usage Percentage"
      "description" : "Root Disk Usage Percentage"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/high_root_disk_usage.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/system_alerts_B.json")
    }

  }

  rule {
    name           = "Media Disk Usage"
    for            = "5m"
    condition      = "B"
    no_data_state  = "NoData"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Media Disk Usage Percentage"
      "description" : "Media Disk Usage Percentage"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/high_media_disk_usage.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/system_alerts_B.json")
    }

  }

  rule {
    name           = "Disk Read Latency"
    for            = "5m"
    condition      = "B"
    no_data_state  = "NoData"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Disk Read Latency Issue",
      "description" : "Disk Read Latency Issue"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/disk_read_latency_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/system_alerts_B.json")
    }
  }

}


resource "grafana_rule_group" "network_alerts" {
  folder_uid         = grafana_folder.network_alerts_folder.uid
  name               = "Network Alerts"
  org_id             = grafana_organization.main_org.id
  disable_provenance = true
  interval_seconds   = 60

  rule {
    name           = "Webpages Status"
    for            = "5m"
    condition      = "B"
    no_data_state  = "NoData"
    exec_err_state = "Error"
    annotations = {
      "summary" : "Webpage Status"
      "description" : "Webpage Status"
    }

    notification_settings {
      contact_point = grafana_contact_point.telegram.name
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
      model          = file("${path.module}/alerts_files/network_status_A.json")
    }

    data {
      ref_id         = "B"
      datasource_uid = "-100"
      query_type     = ""
      relative_time_range {
        from = 600
        to   = 0
      }
      model = file("${path.module}/alerts_files/network_alerts_B.json")
    }

  }

}