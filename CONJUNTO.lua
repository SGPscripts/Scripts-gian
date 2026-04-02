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

local Tab = Window:CreateTab("SCRIPTS mani xd")

-- boton no textures
Tab:CreateButton({
    Name = "T3CHN0S BEAR HUB",
    Callback = function()
        local ok, err = pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/BEAR-(Alpha)-T3CHN0S-BEAR-HUB-123480"))()
        end)

        if not ok then
            warn("error en you vs homer:", err)
        end
    end
})
-- boton strongest battlegrounds
Tab:CreateButton({
    Name = "TSB HUB",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://rawscripts.net/raw/The-Strongest-Battlegrounds-The-strongest-battleground-50830"
            ))()
        end)
    end
})
-- boton tsb hub (tu script)
Tab:CreateButton({
    Name = "TSB AUTOFARM",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/SGPscripts/roblox-scripts/refs/heads/main/tsb.lua"
            ))()
        end)
    end
})
-- boton baldy to sorcerer
Tab:CreateButton({
    Name = "GOJO SCRIPT",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/refs/heads/main/LatestV2.lua"
            ))()
        end)
    end
})
-- boton skin changer (soluna)
Tab:CreateButton({
    Name = "SKIN CHANGER QUE TANTO JODISTE XD",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/endoverdosing/Soluna-API/refs/heads/main/skin-changer.lua",
                true
            ))()
        end)
    end
})-- boton rivals skin changer
Tab:CreateButton({
    Name = "rivals skin changer 2",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://rawscripts.net/raw/RIVALS-yabujin-skinchanger-crack-105883"
            ))()
        end)
    end
    })
    -- boton blade ball (menos efectos)
Tab:CreateButton({
    Name = "BLADE BALL",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/ImNotRox1/Trevous-Hub/refs/heads/main/blade-ball.lua"
            ))()
        end)
    end
})
-- boton blade ball soluna
Tab:CreateButton({
    Name = "BLADE BALL 2",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://soluna-script.vercel.app/bladeball.lua",
                true
            ))()
        end)
    end
})
-- boton bear alpha
Tab:CreateButton({
    Name = "BEAR ALPHA",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://rawscripts.net/raw/BEAR-(Alpha)-Bear-Alpha-l-BASC-THE-RETURN-I-READ-DESCRIPTION-115972"
            ))()
        end)
    end
})
-- boton infinite yield
Tab:CreateButton({
    Name = "infinite yield",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
            ))()
        end)
    end
})
-- boton no effects
Tab:CreateButton({
    Name = "AIMBOT",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://pastebin.com/raw/CgiJB7mR"
            ))()
        end)
    end
})
-- boton no effects
Tab:CreateButton({
    Name = "MEME SEA",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://rawscripts.net/raw/UPDATE-4-Meme-Sea-FIXZ-HUB-OP-AUTO-FARM-60242"
            ))()
        end)
    end
})

