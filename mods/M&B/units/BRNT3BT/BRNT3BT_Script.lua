local TLandUnit = import('/lua/terranunits.lua').TLandUnit

local WeaponsFile = import('/lua/terranweapons.lua')

local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local TDFMachineGunWeapon = WeaponsFile.TDFMachineGunWeapon

local EffectTemplate = import('/lua/EffectTemplates.lua')
local CreateAttachedEmitter = CreateAttachedEmitter

BRNT3BT = Class(TLandUnit) {

    Weapons = {
	
        MainGun = Class(TDFGaussCannonWeapon) {
		
            FxMuzzleFlashScale = 1.0,
			
            FxMuzzleFlash = { '/effects/emitters/proton_artillery_muzzle_01_emit.bp' }, 
			
			FxGroundEffect = EffectTemplate.ConcussionRingLrg01,
			
	        FxVentEffect = EffectTemplate.CDisruptorVentEffect,
			
	        FxVentEffect2 = EffectTemplate.WeaponSteam01,
	        FxVentEffect3 = EffectTemplate.CDisruptorGroundEffect,
			
	        FxMuzzleEffect = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
			
	        PlayFxMuzzleSequence = function(self, muzzle)
			
		        local army = self.unit:GetArmy()
		        
	            for k, v in self.FxGroundEffect do
                    CreateAttachedEmitter(self.unit, 'BRNT3BT', army, v):ScaleEmitter(0.5)
                end

  	            for k, v in self.FxVentEffect do
                    CreateAttachedEmitter(self.unit, 'vent01', army, v):ScaleEmitter(0.5)
                    CreateAttachedEmitter(self.unit, 'vent02', army, v):ScaleEmitter(0.5)
                    CreateAttachedEmitter(self.unit, 'vent03', army, v):ScaleEmitter(0.5)
                    CreateAttachedEmitter(self.unit, 'vent04', army, v):ScaleEmitter(0.5)
                end
				
  	            for k, v in self.FxVentEffect2 do
                    CreateAttachedEmitter(self.unit, 'stikkflamme', army, v):ScaleEmitter(1.0)
                end
				
	            for k, v in self.FxVentEffect3 do
                    CreateAttachedEmitter(self.unit, 'BRNT3BT', army, v):ScaleEmitter(0.5)
                end				

  	            for k, v in self.FxMuzzleEffect do
                    CreateAttachedEmitter(self.unit, 'stikkflamme', army, v):ScaleEmitter(0.7)
                end
				
            end, 
		},
		
        rocket = Class(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0.7	},

    },
}

TypeClass = BRNT3BT