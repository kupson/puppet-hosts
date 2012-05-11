Facter.add('hosts_managed') do
    setcode do
        ret = 'false'
        if FileTest.exists?('/etc/hosts')
            File.open('/etc/hosts') do |file|
                file.grep(/# managed by puppet class "hosts"$/) do |line|
                    ret = 'true'
                end
            end
        end
        ret
    end
end

