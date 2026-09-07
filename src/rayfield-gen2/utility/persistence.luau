-- Rayfield/utility/persistence  (bundle module #61)
-- deobfuscated from Rayfield Gen2 v1.2.0

local ae, persistenceConfig, persistenceSettings =
    {}, require(script.Parent.persistenceConfig), require(script.Parent.persistenceSettings)
ae.getPath = persistenceConfig.getPath
ae.save = persistenceConfig.save
ae.load = persistenceConfig.load
ae.applyTo = persistenceConfig.applyTo
ae.list = persistenceConfig.list
ae.delete = persistenceConfig.delete
ae.getSettingsPath = persistenceSettings.getSettingsPath
ae.saveSettings = persistenceSettings.saveSettings
ae.loadSettings = persistenceSettings.loadSettings
return ae
