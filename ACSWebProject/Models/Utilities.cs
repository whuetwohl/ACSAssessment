using Microsoft.AspNetCore.HttpLogging;
using Microsoft.EntityFrameworkCore;
using System.Data.Common;

namespace ACSWebProject.Models
{
    public static class Utilities 
    {
        public static void LogError(Exception ex)
        {
            try
            {
                using (var db = new AcsContext())
                {
                    Error error = new Error();
                    error.Type = ex.GetType().ToString();
                    error.Message = ex.Message;
                    error.DateTime = DateTime.Now;
                    db.Errors.Add(error);
                    db.SaveChanges();
                }
            }
            catch(DbException e)
            {

            } 
        }
    }
}
