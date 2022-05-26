using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(it_lab4_mvc.Startup))]
namespace it_lab4_mvc
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
