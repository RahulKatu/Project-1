using LSC.SmartCertify.Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace LSC.SmartCertify.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;
        private readonly LearningContext learningContext;

        public WeatherForecastController(ILogger<WeatherForecastController> logger,LearningContext learningContext)
        {
            this.learningContext = learningContext;
            _logger = logger;
        }

        [HttpGet(Name = "GetWeatherForecast")]
        //public IEnumerable<WeatherForecast> Get()
        //{
        //    return Enumerable.Range(1, 5).Select(index => new WeatherForecast
        //    {
        //        Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
        //        TemperatureC = Random.Shared.Next(-20, 55),
        //        Summary = Summaries[Random.Shared.Next(Summaries.Length)]
        //    })
        //    .ToArray();
        //}
        public IActionResult Get()
        {
            var model=learningContext.UserProfiles.ToList();
            return Ok(model);
        }
    }
}
