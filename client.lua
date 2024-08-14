local unarmed = GetHashKey("weapon_unarmed")

local oldHash = 0

local cached = {
    hash = 0,
    ped = 0,
    allowed = false,
}

local function Disarm(data)
    if data.hash ~= unarmed then
        SetCurrentPedWeapon(data.ped, unarmed, true)
        RemoveWeaponFromPed(data.ped, data.hash)
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            args = {"^*^2WeaponPerms", '^*^1This weapon is restricted!'}
        })
    end
end

RegisterNetEvent('WeaponPerms:Result')
AddEventHandler('WeaponPerms:Result', function(result)
    cached.hash = result.hash
    cached.ped = PlayerPedId() -- It's better to get the ped here to ensure it's up to date
    cached.allowed = result.allowed
    if not cached.allowed then
        Disarm(cached)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Check every second

        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)

        if oldHash ~= weapon then
            oldHash = weapon
            TriggerServerEvent('WeaponPerms:CheckPerms', weapon)
        end
    end
end)
