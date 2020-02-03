local player = ...
local pn;
if player == PLAYER_1 then
	pn = 0
else
	pn = 1
end
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
local path = GAMESTATE:GetCurrentSong():GetSongFilePath()

local t = LoadFont("_wendy small")..{
	Name="TheeGauntlet"..tostring(pn),
	InitCommand=cmd(diffusealpha,1.0; x, 0; y, _screen.cy * 2 - 15; zoom,0.25 ),
	OnCommand=function(self)
		if string.find(path, "The Fantastic Attack Gauntlet") ~= nil then -- and not stats:IsDisqualified() then
			local nf = stats:GetTapNoteScores( "TapNoteScore_W1" )
			local ne = stats:GetTapNoteScores( "TapNoteScore_W2" )
			local ng = stats:GetTapNoteScores( "TapNoteScore_W3" )
			local nd = stats:GetTapNoteScores( "TapNoteScore_W4" )
			local nw = stats:GetTapNoteScores( "TapNoteScore_W5" )
			local nm = stats:GetTapNoteScores( "TapNoteScore_Miss" )
			local nh = stats:GetRadarActual():GetValue( "RadarCategory_Holds" )
			local nr = stats:GetRadarActual():GetValue( "RadarCategory_Rolls" )
			local nn = stats:GetRadarActual():GetValue( "RadarCategory_Mines" )
			local th = stats:GetRadarPossible():GetValue( "RadarCategory_Holds" )
			local tr = stats:GetRadarPossible():GetValue( "RadarCategory_Rolls" )
			local tn = stats:GetRadarPossible():GetValue( "RadarCategory_Mines" )
			local score = nf*3 + ne - nm + nh*3 + nr*3 - (tn-nn)*3
			local total = 3*(nf+ne+ng+nd+nw+nm) + th*3 + tr*3
			self:settext("Thee Gauntlet: " .. tostring(score) .. "/" .. tostring(total))
		end
	end
}

return t