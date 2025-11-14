
using LSC.SmartCertify.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Scalar.AspNetCore;

namespace LSC.SmartCertify.API
{
    public class Program
    {
        [Obsolete]
        public static void Main(string[] args)
        {
            #region Configurating services start*********************************************************
            var builder = WebApplication.CreateBuilder(args);
            builder.Services.AddDbContext<LearningContext>(
                options =>
                {
                    options.UseSqlServer(builder.Configuration.GetConnectionString("DbContext"),
                        providerOptions => providerOptions.EnableRetryOnFailure());
                }
                );

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
            builder.Services.AddOpenApi();

            #endregion

            #region Configurating Middleware will start 

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.MapOpenApi();
                app.MapScalarApiReference(
                    options =>
                    {
                        options.WithTitle("Rahul Api");
                        options.WithTheme(ScalarTheme.BluePlanet);
                        options.WithSidebar(true);
                    }
                    );
                app.UseSwaggerUi(options =>
                {
                    options.DocumentPath="openapi/v1.json";
                });
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
            #endregion
        }
    }
}
