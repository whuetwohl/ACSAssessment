using ACSWebProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace ACSWebProject.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            try
            {
                var apiKey = string.Empty;
                using (AcsContext db = new AcsContext())
                {
                    apiKey = db.Settings.First(a => a.Name.ToUpper() == "GoogleAPIKey".ToUpper()).Value;
                    var defaultCoords = db.Settings.First(c => c.Name.ToUpper() == "DefaultMapCoordinates".ToUpper()).Value;
                    var weatherAPIURL = db.Settings.First(a => a.Name.ToUpper() == "WeatherGovAPIURL".ToUpper()).Value;
                    var defaultZoom = db.Settings.First(z => z.Name.ToUpper() == "DefaultMapZoomLevel".ToUpper()).Value;
                    var useDefaultUI = db.Settings.First(d => d.Name.ToUpper() == "DisableDefaultUI".ToUpper()).Value;
                    ViewData["lat"] = defaultCoords.Split(",")[0];
                    ViewData["lng"] = defaultCoords.Split(",")[1];
                    ViewData["weatherAPI"] = weatherAPIURL;
                    ViewData["zoom"] = defaultZoom;
                    ViewData["mapUI"] = useDefaultUI;
                }
                HomeViewModel model = new HomeViewModel($"{apiKey}");

                return View(model);
            }
            catch (Exception ex)
            {
                Utilities.LogError(ex);
                return View("error");
            }
        }

        public IActionResult Error()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Error(string message)
        {
            var ex = new Exception(message);
            Utilities.LogError(ex);

            return View();
        }

        [HttpPost]
        public JsonResult PostRequestResponse(WebRequest response)
        {
            try
            {
                using (var db = new AcsContext())
                {
                    db.WebRequests.Add(response);
                    db.SaveChanges();
                }

                return new JsonResult(Ok());
            }
            catch (Exception ex)
            {
                Utilities.LogError(ex);
                return new JsonResult(Ok("{Result: Error}"));
            }
        }
    }
}
