RegisterNetEvent('WeaponPerms:CheckPerms')
AddEventHandler('WeaponPerms:CheckPerms', function(weapon)

    local result = {}

    local unarmed = GetHashKey('weapon_unarmed')

    if weapon ~= unarmed then
        if IsPlayerAceAllowed(source, Weapons.BypassPermission) then
            result = {
                allowed = true,
                hash = weapon
            }
            TriggerClientEvent('WeaponPerms:Result', source, result)
            return
        elseif Weapons.weps[weapon] then
            result = {
                allowed = IsPlayerAceAllowed(source, Weapons.weps[weapon].ace),
                hash = weapon
            }
            TriggerClientEvent('WeaponPerms:Result', source, result)
            return
        else
            result = {
                allowed = Weapons.AllowedByDefault
            }
            TriggerClientEvent('WeaponPerms:Result', source, result)
            return
        end
    end
end)