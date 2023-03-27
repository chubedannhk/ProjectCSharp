using Microsoft.AspNetCore.Mvc;

namespace FoodOnlineSystem.Controllers;
[Route("dashboard")]
public class DashboardController : Controller
{
    [Route("index")]
    [Route("")]
    [Route("~/")]
    public IActionResult Index()
    {
        return View();
    }
}
