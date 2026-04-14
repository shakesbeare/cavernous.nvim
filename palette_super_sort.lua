local M = {}

--- Would it have been easier to just make a table indicating the order
--- I wanted? Yup.
M.super_sort = function(palette_data)
    table.sort(palette_data, function(a, b)
        -- force the black comes first
        if a.color_name == "jet_black" then
            return true
        end

        if b.color_name == "jet_black" then
            return false
        end

        if a.color_name == "black" then
            return true
        end

        if b.color_name == "black" then
            return false
        end

        -- force grays to come next, in order
        local a_i = tonumber(string.sub(a.color_name, -1))
        local b_i = tonumber(string.sub(b.color_name, -1))

        if a_i and b_i then
            return a_i < b_i
        elseif a_i and not b_i then
            return true
        elseif b_i then
            return false
        end

        -- put bright after base
        if string.starts(a.color_name, "bright_") then
            local a_base = string.sub(a.color_name, 8)
            if a_base == b.color_name then
                return false
            end
        end

        if string.starts(b.color_name, "bright_") then
            local b_base = string.sub(b.color_name, 8)
            if b_base == a.color_name then
                return true
            end
        end

        -- if all else fails, sort by hsl (in hls order)

        if a.hsl.h < b.hsl.h then
            return true
        elseif a.hsl.h > b.hsl.h then
            return false
        end

        if a.hsl.l < b.hsl.l then
            return true
        elseif a.hsl.l > b.hsl.l then
            return false
        end

        if a.hsl.s > b.hsl.s then
            return true
        elseif a.hsl.s < b.hsl.s then
            return false
        end

        -- should be unreachable because that would mean duplicate colors
        return false
    end)
    return palette_data
end

return M
