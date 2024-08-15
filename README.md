# Simple **weapon perms** script

## **How does this work?**
 - It checks through the weapons that the ped is currently using and checks it against the config file. Once it has done that if it's in the config file (checked by hash) it will check if the user has the ace per
 - If the person does not have the ace perm it will restrict the weapon

![image](https://github.com/user-attachments/assets/4d879d2a-e9ee-4b03-a1fe-5663025bc932)

## **How do I setup the config file?**
  - You will copy one of the previous lines and put `GetHashKey('weapon_spawn')` and replace `weapon_spawn` with whatever gun spawncode you need.
  - If you want all of the weapons that are not on the list to be automatically allowed you enable the `AllowedByDefault` to `true`

![image](https://github.com/user-attachments/assets/f7e4c697-aeed-4bcd-8e31-c80480752170)

## **What do I need to setup?**
 - You need to setup a `weapon_permissions.cfg` and put the ace perms in like this `add_ace group.admin weapon.combatmg allow` depending on what group/player you want to give it too.

This is my second release of scripts and I used some code from other repo's to get some of the logic down for this. There are NO dependencies which means you can just throw this in your server and go to town.
