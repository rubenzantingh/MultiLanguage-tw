local addonName = ...
local optionsFrame = CreateFrame("Frame")

local function languageExists(value)
    for _, language in ipairs(MultiLanguageOptions.AVAILABLE_LANGUAGES) do
        if language.value == value then
            return true
        end
    end
    return false
end

local function addLanguageOption()
    if not languageExists('tw') then
        table.insert(MultiLanguageOptions.AVAILABLE_LANGUAGES, {value = 'tw', text = 'Chinese (Traditional)'})
        AddLanguageDropdownOption()
    end

    if MultiLanguageTranslations['tw'] == nil then
        MultiLanguageTranslations['tw'] = {
            description = '描述',
            objectives = '目標'
        }
    end
end

local function addonLoaded(self, event, addonLoadedName)
    if addonLoadedName == addonName then
        addLanguageOption()
    end
end

optionsFrame:RegisterEvent("ADDON_LOADED")
optionsFrame:SetScript("OnEvent", addonLoaded)
