local mpd_util = {}

function read_all(file)
    local path = "/tmp/" ..  file
    local f = assert(io.open(path, "rb"))
    local content = f:read("*all")
    f:close()

    os.execute("rm " .. path)
    return content
end

function current_track()
    return read_all("current_track.txt")
end

function update_stats()
    os.execute("mpc > /tmp/mpc_status.txt")
    os.execute("mpc current > /tmp/current_track.txt")
end

function mpd_status()
    if read_all("mpc_status.txt"):find("playing") == nil then
        return "Paused"
    else
        return "Playing"
    end
end

mpd_util.current_track = current_track
mpd_util.update_stats = update_stats
mpd_util.mpd_status = mpd_status

return mpd_util
