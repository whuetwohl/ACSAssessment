using System;
using System.Collections.Generic;

namespace ACSWebProject.Models;

public partial class WebRequest
{
    public int Id { get; set; }

    public string Url { get; set; } = null!;

    public string ResponseCode { get; set; } = null!;

    public string Status { get; set; } = null!;

    public string ResponsePayload { get; set; } = null!;

    public DateTime DateAndTime { get; set; }
}
