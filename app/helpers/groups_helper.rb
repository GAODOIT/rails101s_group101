module GroupsHelper
        $group_log = Logger.new('/var/log/rails.log', 10, 1024000)
        $group_log.level = Logger::DEBUG
end
