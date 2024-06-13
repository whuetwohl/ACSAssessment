namespace ACSWebProject.Models
{
    public class HomeViewModel
    {
        public string? apiKey { get; set; }

        public HomeViewModel(string key)
        {
            apiKey = key ?? throw new ArgumentNullException(nameof(apiKey));
        }
    }
}
