local OriginalKeyUpValue = 0
function StopAudio()
    game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("BoomboxStop")
end
--//------------------------------------------------------------------------------------------\\--
function stop(ID, Key)
    local cor = coroutine.wrap(function()
        wait(game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength-0.1)
        if game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
            StopAudio()
        end
    end)
    cor()
end
--//------------------------------------------------------------------------------------------\\--
function Play(ID)
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
        local Tool = nil
        game:GetService("Players").LocalPlayer.Backpack["[Boombox]"].Parent = game:GetService("Players").LocalPlayer.Character
        game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
        game:GetService("Players").LocalPlayer.Character["[Boombox]"].RequiresHandle = false
        game:GetService("Players").LocalPlayer.Character["[Boombox]"].Parent = game:GetService("Players").LocalPlayer.Backpack
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
        if Tool ~= true then
            if Tool then
                Tool.Parent = game:GetService("Players").LocalPlayer.Character
            end
        end
        game:GetService("Players").LocalPlayer.Character.LowerTorso:WaitForChild("BOOMBOXSOUND")
            local cor = coroutine.wrap(function()
                repeat wait() until game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength > 0.01
                OriginalKeyUpValue = OriginalKeyUpValue+1
                stop(ID, OriginalKeyUpValue)
            end)
        cor()
    end
end