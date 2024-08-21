print("Hello World! DLaby addon loaded")

--Events
local event = CreateFrame("Frame")
event:SetScript(
	"OnEvent",
	function(self, event, ...)
		self[event](self, ...)
	end
)

--Register events
event:RegisterEvent("PLAYER_REGEN_ENABLED")
event:RegisterEvent("PLAYER_REGEN_DISABLED")

--Handle events
function event:PLAYER_REGEN_ENABLED()
        for i = 1, NUM_CHAT_WINDOWS do
            local f = _G["ChatFrame"..i]
            if f then
                if not f.minimized and f:IsShown() then
		     	UIFrameFadeIn(f,1,0,1)
			f:SetScript("OnEnter", nil)
			f:SetScript("OnLeave", nil)
                end
            end
        end
end
function event:PLAYER_REGEN_DISABLED()
        for i = 1, NUM_CHAT_WINDOWS do
            local f = _G["ChatFrame"..i]
            if f then
                if not f.minimized and f:IsShown() then
		      	UIFrameFadeOut(f,1,1,0)
			f:SetScript("OnEnter", function() UIFrameFadeIn(f,0.1,0,1) end)
			f:SetScript("OnLeave", function() UIFrameFadeIn(f,0.1,1,0) end)
                end
            end
        end
end










