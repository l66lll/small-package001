-- Copyright 2021-2022 Lienol <lawlienol@gmail.com>
module("luci.controller.openvpn-client", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/luci-app-openvpn-client") then return end

    entry({"admin", "services"}, firstchild(), "services", 10).dependent = false
    entry({"admin", "services", "openvpn-client"}, cbi("openvpn-client/settings"), _("OpenVPN Client"), 50).acl_depends = { "luci-app-openvpn-client" }
    entry({"admin", "services", "openvpn-client", "client"}, cbi("openvpn-client/client")).leaf = true
end
