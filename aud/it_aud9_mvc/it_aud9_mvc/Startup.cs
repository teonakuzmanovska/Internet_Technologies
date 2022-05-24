using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(it_aud9_mvc.Startup))]
namespace it_aud9_mvc
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
