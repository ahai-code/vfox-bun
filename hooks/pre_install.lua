local util = require("util")
--- Returns some pre-installed information, such as version number, download address, local files, etc.
--- If checksum is provided, vfox will automatically check it for you.
--- @param ctx table
--- @field ctx.version string User-input version
--- @return table Version information
function PLUGIN:PreInstall(ctx)
    if #util.RELEASES == 0 then
        util:getInfo()
    end
    local releases = util.RELEASES
    table.sort(releases, function(a, b)
        return util:compare_versions(a, b)
    end)
    if ctx.version == "latest" then
        return releases[1]
    end
    for _, release in ipairs(releases) do
        if release.version == ctx.version then
            return release
        end
    end
    return {}
end
