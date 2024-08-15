-- Copyright 2021-2022 Lienol <lawlienol@gmail.com>
module("luci.controller.anti-client", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/luci-app-Anti-client") then return end

    entry({"admin", "services"}, firstchild(), "services", 10).dependent = false
    entry({"admin", "services", "anti-client"}, cbi("anti-client/settings"), _("Anti Client"), 50).acl_depends = { "luci-app-anti-client" }
    entry({"admin", "services", "anti-client", "client"}, cbi("anti-client/client")).leaf = true
end
