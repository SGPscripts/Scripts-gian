-- loader limpio de rayfield
pcall(function()
    getgenv().SecureMode = true
end)

local mirrors = {
    "https://sirius.menu/rayfield",
    "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua",
    "https://raw.githubusercontent.com/jensonhirst/Rayfield/main/source"
}

local function http_get(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)
    if ok and type(res) == "string" then
        return res
    end

    if syn and syn.request then
        local r = syn.request({Url = url, Method = "GET"})
        if r and r.Body then return r.Body end
    end

    if request then
        local r = request({Url = url, Method = "GET"})
        if r and r.Body then return r.Body end
    end

    if http and http.request then
        local r = http.request({Url = url, Method = "GET"})
        if r and r.Body then return r.Body end
    end

    return nil
end

local Rayfield
for _, url in ipairs(mirrors) do
    local src = http_get(url)
    if src then
        local ok, lib = pcall(function()
            return loadstring(src)()
        end)
        if ok and lib then
            Rayfield = lib
            break
        end
    end
end

if not Rayfield then
    warn("rayfield no cargo")
    return
end

-- desde aca seguis tu script normal
-- ej:
-- local Window = Rayfield:CreateWindow({...})
-- ventana (si ya la tenes, saltea esta parte)
local Window = Rayfield:CreateWindow({
    Name = "Conjunto de scripts giansini",
    LoadingTitle = "Cargando",
    LoadingSubtitle = "Si lees esto soy santi",
    ConfigurationSaving = {
        Enabled = false
    }
})

local Tab = Window:CreateTab("graficos")

-- boton no textures
Tab:CreateButton({
    Name = "YOU VS HOMER",
    Callback = function()
        local ok, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Cat558-uz/Idisie/refs/heads/main/816d5b3cffe4ce14.lua.txt"))()
        end)

        if not ok then
            warn("error en you vs homer:", err)
        end
    end
})
