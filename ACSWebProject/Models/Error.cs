using System;
using System.Collections.Generic;

namespace ACSWebProject.Models;

public partial class Error
{
    public int Id { get; set; }

    public string Type { get; set; } = null!;

    public string Message { get; set; } = null!;

    public DateTime DateTime { get; set; }
}
