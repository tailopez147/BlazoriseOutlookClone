using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Blazorise;
using Blazorise.FluentUI2;
using Blazorise.Icons.FluentUI;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<BlazoriseOutlookClone.UI.App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services
    .AddBlazorise(options =>
    {
        options.Immediate = true;
    })
    .AddFluentUI2Providers()
    .AddFluentUIIcons();

await builder.Build().RunAsync();
