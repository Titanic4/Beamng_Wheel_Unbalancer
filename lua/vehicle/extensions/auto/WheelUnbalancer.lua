local originalWeight = {}
 local M = {}
local function onInit()
	if inbalance == nil  then
   obj:queueGameEngineLua("extensions.load('WheelUnbalancer')")
  end
end
function inbalance(extent)
	local vehicle = v
	if(extent < 1) then
		print("Imbalance extent is less than 1 - the value has to be greater than 1.")
		return
	end
    for _, n in pairs(vehicle.data.wheels) do
				
			for k,val in pairs(n.nodes) do
		
				
			if(k > table.getn(n.nodes) / 2) then break end
				if(k % 2 == 0) then
				if(originalWeight[val] == nil) then
				originalWeight[val] = vehicle.data.nodes[val].nodeWeight
				obj:setNodeMass(val, originalWeight[val]*extent)
				else
				obj:setNodeMass(val, originalWeight[val]*extent)
				end
			end
		
		end
		
		end
	    end
	
M.inbalance = inbalance;
M.onInit = onInit
M.onReset = onInit
print("Imbalance module was loaded.")
return M