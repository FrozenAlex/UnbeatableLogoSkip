using HarmonyLib;
using UnbeatableLogoSkip;

using UnityEngine.SceneManagement;

namespace Patches {
    
    public class Patches
    {
        // make sure DoPatching() is called at start either by
        // the mod loader or by your injector

        public static void DoPatching()
        {
            var harmony = new Harmony("com.frozenalex.skipLogoMod");
            harmony.PatchAll();
        }
    }

  
    [HarmonyPatch(typeof(LogoScreenController), "Start")]
    class SkipLogoScreen
    {
        static void Postfix(LevelManager __instance)
        {
            Plugin.LOGGER.LogInfo($"Skipping logo screen!");
            SceneManager.LoadScene("TrainLevelSelect");
        }
    }
}
