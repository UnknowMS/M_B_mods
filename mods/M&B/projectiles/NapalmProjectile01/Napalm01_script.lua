#
# Flamethrower Projectile
#
local FlameThrowerProjectile01 = import('/mods/M&B/lua/EXBlackOpsprojectiles.lua').FlameThrowerProjectile01
local RandomFloat = import('/lua/utilities.lua').GetRandomFloat

Napalm = Class(FlameThrowerProjectile01) {}
TypeClass = Napalm