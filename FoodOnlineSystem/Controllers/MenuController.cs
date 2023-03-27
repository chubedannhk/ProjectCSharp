using Microsoft.AspNetCore.Mvc;

namespace FoodOnlineSystem.Controllers;
[Route("menu")]
public class MenuController : Controller
{
    
    [Route("")]
    [Route("index")]
    public IActionResult Index()
    {
        return View();
    }
}
