-- bakit ganon?
-- wala eh.
-- ganon talaga.

local redz_ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/ui_source/refs/heads/main/redzhub.ui.luau"))()
local Window = redz_ui:MakeWindow({
    Title = "Kai Hub | Meme Sea",
    Subtitle = "by Kai Scripts",
    SaveFolder = "save_ui"
  })

Window:AddMinimizeButton({
    Button = { Image = "", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
  })

redz_ui:SetTheme("Purple")

local Tab1 = Window:MakeTab({ "Example", "house" })
local Tab2 = Window:MakeTab({ "Example Ui", "carrot" })
