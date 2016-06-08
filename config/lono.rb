# An example of additional volumes, specified per instance, would be:
# * WebServer would have /dev/sdb, 25 Gb, GP2, /var/www
# * DBServer would have /dev/sdb, 50 Gb, GP2, /var/lib/pgsql, and /dev/sdc, 50 Gb, GP2, /var/db_backups
# * TomcatServer would have no additional volumes (just the root volume)

template "web.json" do
  source "server.json.erb"
  variables(
    volumes: [{
      device: "/dev/sdb",
      size: 25,
      type: "gp2",
      mount_point: "/var/www"
    }]
  )
end

template "db.json" do
  source "server.json.erb"
  variables(
    volumes: [{
      device: "/dev/sdb",
      size: 50,
      type: "gp2",
      mount_point: "/var/lib/pgsql"
    },{
      device: "/dev/sdc",
      size: 50,
      type: "gp2",
      mount_point: "/var/db_backups"
    }]
  )
end

template "tomcat.json" do
  source "server.json.erb"
end
