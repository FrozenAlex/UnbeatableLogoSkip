using BepInEx;
using BepInEx.Logging;

namespace UnbeatableLogoSkip
{
    
    [BepInPlugin(PluginInfo.PLUGIN_GUID, PluginInfo.PLUGIN_NAME, PluginInfo.PLUGIN_VERSION)]
    // [BepInProcess("Risk of Rain 2.exe")]
    public class Plugin : BaseUnityPlugin
    {
        public static Plugin instance;
        public static ManualLogSource LOGGER;

        private void Awake()
        {
            instance = this;
            LOGGER = Logger;
            
            // Plugin startup logic
            LOGGER.LogInfo($"Plugin {PluginInfo.PLUGIN_GUID} is loaded!");
            Patches.Patches.DoPatching();
        }
    }

}
