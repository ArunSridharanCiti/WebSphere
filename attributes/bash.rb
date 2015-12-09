bash 'extract_module' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
  basedirname1=`basename $currentdir-$srvDate`
    mkdir -p #{currentdir-$srvDate}
    tar xzf #{src_filename} -C #{currentdir-$srvDate}
    mv #{currentdir-$srvDate}/*/* #{currentdir-$srvDate}/
    EOH
  not_if { ::File.exists?(currentdir-$srvDate) }
end