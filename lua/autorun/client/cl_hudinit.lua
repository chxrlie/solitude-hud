local healthIcon = Material("ui/heart.png")
local pointIcon = Material("ui/shop.png")
local pingIcon = Material("ui/signal.png")

hook.Add("HUDPaint", "HUDPaint_DrawHUD", function()
    local clientPlayer = LocalPlayer()
    local playerName = "Longname McGee"
    if string.len(clientPlayer:GetName()) <= 16 then
        playerName = clientPlayer:GetName()
    end
    local playerHealth = clientPlayer:Health()
    local playerPing = clientPlayer:Ping()
    local playerWallet = 0
    if clientPlayer.PS2_Wallet then
        playerWallet = clientPlayer.PS2_Wallet.points
    end

    surface.SetTextColor(255, 255, 255, 255)
    -- Base Panel
    surface.SetDrawColor(40, 40, 40, 210)
    surface.DrawRect(50, ScrH()-118, 250, 68)
    
    -- Header
    surface.SetFont("DermaDefaultBold")
    surface.SetTextPos(121, ScrH()-116)
    surface.DrawText(string.upper(playerName))

    --Body
    surface.SetFont("DermaDefault")
    surface.SetTextPos(136, ScrH()-97)
    surface.DrawText(clientPlayer:Health())

    surface.SetTextPos(136, ScrH()-82)
    if clientPlayer.PS2_Wallet then
        surface.DrawText(playerWallet)
    end

    surface.SetTextPos(136, ScrH()-67)
    surface.DrawText(playerPing)

    -- Icons
    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(healthIcon)
    surface.DrawTexturedRect(121, ScrH()-97, 14, 14)
    surface.SetMaterial(pointIcon)
    surface.DrawTexturedRect(121, ScrH()-82, 14, 14)
    surface.SetMaterial(pingIcon)
    surface.DrawTexturedRect(121, ScrH()-67, 14, 14)
end)

hook.Add("InitPostEntity", "AvatarHUDLoad", function()
    local Avatar = vgui.Create("AvatarImage", Panel)
    Avatar:SetSize(64, 64)
    Avatar:SetPos(52, ScrH()-116)
    Avatar:SetPlayer( LocalPlayer(), 64)
end)

print("Made with love <3 \n ~C")