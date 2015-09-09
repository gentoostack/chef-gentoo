for type in [ "keywords", "mask", "unmask", "use" ] do
  directory "/etc/portage/package.#{type}" do
    owner "root"
    group "root"
    mode 0755
  end

  file "/etc/portage/package.#{type}/default" do
    owner "root"
    group "root"
    mode 0644
  end
end

directory "/etc/portage/patches" do
  owner "root"
  group "root"
  mode 0755
end

directory "/etc/portage/repos.conf" do
  owner "root"
  group "root"
  mode 0755
end

template  "/etc/portage/repos.conf/gentoo.conf" do 
  source "etc/portage/repos.conf/gentoo.conf.erb"
  variables({
    :rsync_mirror => node[:gentoo][:rsync_mirror]
  })
end
