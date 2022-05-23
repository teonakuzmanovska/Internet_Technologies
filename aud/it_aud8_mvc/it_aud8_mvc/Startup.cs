using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(it_aud8_mvc.Startup))]
namespace it_aud8_mvc
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
