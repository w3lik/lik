--- 获取一个table的正确长度
--- 不建议使用，在不同的lua引擎可能会引起异步，但却没法保证平台提供的引擎是否可靠
---@protected
---@param table table
---@return number
function tlen(table)
    local len = 0
    for _, _ in pairs(table) do
        len = len + 1
    end
    return len
end

--- 打印栈
function stack(...)
    local out = { '[TRACE]' }
    local n = select('#', ...)
    for i = 1, n, 1 do
        local v = select(i, ...)
        out[#out + 1] = tostring(v)
    end
    out[#out + 1] = '\n'
    out[#out + 1] = debug.traceback('', 2)
    print(table.concat(out, ' '))
end

--- 输出详尽内容
---@param value any 输出的table
---@param description string 调试信息格式
---@param nesting number 输出时的嵌套层级，默认为 10
function dump(value, description, nesting)
    if type(nesting) ~= 'number' then nesting = 10 end
    local lookup = {}
    local result = {}
    local traceback = string.explode('\n', debug.traceback('', 2))
    local str = '- dump from: ' .. string.trim(traceback[3])
    local _format = function(v)
        if type(v) == 'string' then
            v = '\'' .. v .. '\''
        end
        return tostring(v)
    end
    local _dump
    _dump = function(val, desc, indent, nest, keyLen)
        desc = desc or '<var>'
        local spc = ''
        if type(keyLen) == 'number' then
            spc = string.rep(' ', keyLen - string.len(_format(desc)))
        end
        if type(val) ~= 'table' then
            result[#result + 1] = string.format('%s%s%s = %s', indent, _format(desc), spc, _format(val))
        elseif lookup[tostring(val)] then
            result[#result + 1] = string.format('%s%s%s = *REF*', indent, _format(desc), spc)
        else
            lookup[tostring(val)] = true
            if nest > nesting then
                result[#result + 1] = string.format('%s%s = *MAX NESTING*', indent, _format(desc))
            else
                result[#result + 1] = string.format('%s%s = {', indent, _format(desc))
                local indent2 = indent .. '    '
                local keys = {}
                local kl = 0
                local values = {}
                for k, v in pairs(val) do
                    if k ~= '___message' then
                        keys[#keys + 1] = k
                        local vk = _format(k)
                        local vkl = string.len(vk)
                        if vkl > kl then kl = vkl end
                        values[k] = v
                    end
                end
                table.sort(keys, function(a, b)
                    if type(a) == 'number' and type(b) == 'number' then
                        return a < b
                    else
                        return tostring(a) < tostring(b)
                    end
                end)
                for i, k in ipairs(keys) do
                    _dump(values[k], k, indent2, nest + 1, kl)
                end
                result[#result + 1] = string.format('%s}', indent)
            end
        end
    end
    _dump(value, description, ' ', 1)
    str = str .. '\n' .. table.concat(result, '\n')
    print(str)
end