using Microsoft.AspNetCore.Mvc;

namespace FoodOnlineSystem.Controllers;
[Route("book")]
public class BookController : Controller
{
  
    [Route("")]
    [Route("index")]
    public IActionResult Index()
    {
        return View();
    }
}
