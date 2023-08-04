inProgressBar = false
--disabled = false

local function sendUIMessage(resursa, payload, focus)
    if focus then
        SetNuiFocus(true, true)
    end
    SendNUIMessage({
        action = resursa,
        data = payload
    })
end

RegisterNetEvent("blc-ui")
AddEventHandler("blc-ui", function(uiAction, params, focus)
    if focus then
        SetNuiFocus(true, true)
    end
    SendNUIMessage({
        action = uiAction,
        data = params
    })
end)

-- RegisterCommand("hud", function()
--     sendUIMessage("blc-serverhud:show", { ["showing"] = true })
-- end)

local function initializeProgressbar(progressText, progressDuration, canMove)  
    SendNUIMessage({
        action = "initializeProgress",
        data = { ["text"] = progressText, ["duration"] = progressDuration }
    })
    if not canMove then
        inProgressBar = true
        TriggerEvent('mimicInventory', true)
        SetTimeout(progressDuration, function()
            inProgressBar = false
            TriggerEvent('mimicInventory', false)
        end)
    end
end
    
RegisterNUICallback('blc-serverhud:getDetails', function(_, cb)
    local details = remote.getDetails()
    cb({ ["details"] = details })
end)

RegisterNUICallback('blc-ui:removeFocus', function()
    SetNuiFocus(false, false)
end)

exports('sendUIMessage', sendUIMessage)
exports('progressBar', initializeProgressbar)

RegisterNetEvent("blc:notify")
AddEventHandler("blc:notify", function(notifyType, notifyText, notifyDuration)
    print(notifyType, notifyText, notifyDuration)
    if notifyType == "info" then 
        notifyType = 'inform'
      end
    --if not disabled then
        SendNUIMessage({
            action = "blc-notify",
            data = { ["notifyType"] = notifyType, ["text"] = notifyText, ["duration"] = notifyDuration }
        })
    --end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if inProgressBar then
            DisableAllControlActions(0)
            DisableAllControlActions(2)
            EnableControlAction(0,0, true)
            EnableControlAction(0,1, true)
            EnableControlAction(0,2, true)
            EnableControlAction(0,3, true)
            EnableControlAction(0,4, true)
            EnableControlAction(0,5, true)
            EnableControlAction(0,6, true)
            EnableControlAction(0, 249, true)
        end
    end
end)
    
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if not IsPauseMenuActive() then 
            HideHudComponentThisFrame(1)  -- Wanted Stars
            HideHudComponentThisFrame(2)  -- Weapon Icon
            HideHudComponentThisFrame(3)  -- Cash
            HideHudComponentThisFrame(4)  -- MP Cash
            HideHudComponentThisFrame(6)  -- Vehicle Name
            HideHudComponentThisFrame(7)  -- Area Name
            HideHudComponentThisFrame(8)  -- Vehicle Class
            HideHudComponentThisFrame(9)  -- Street Name
            HideHudComponentThisFrame(13) -- Cash Change
            HideHudComponentThisFrame(17) -- Save Game
            HideHudComponentThisFrame(20) -- Weapon Stats
        end
    end
end)

function setState()
    --disabled = not disabled

    --if disabled then
        --SendNUIMessage({
        --    action = "blc-notify",
        --    data = { ["notifyType"] = "success", ["text"] = "Ați dezactivat notificările!", ["duration"] = 5000 }
        --})
    --else
    --    SendNUIMessage({
    --        action = "blc-notify",
    --        data = { ["notifyType"] = "success", ["text"] = "Ați activat notificările!", ["duration"] = 5000 }
    --    })
    --end
end