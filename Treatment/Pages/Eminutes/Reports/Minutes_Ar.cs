using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using Website.Classes;
using System.IO;
using Treatment.Entity;
using DevExpress.DataAccess.Sql.DataApi;

namespace Treatment.Pages.Eminutes.Reports
{
    public partial class Minutes_Ar : DevExpress.XtraReports.UI.XtraReport
    {
        public Minutes_Ar()
        {
            InitializeComponent();
        }

        private void xrPictureBox4_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            if (SessionWrapper.LoggedUser.Employee_Signature != null && SessionWrapper.LoggedUser.Employee_Signature != "")
            {
                ECMSEntities db = new ECMSEntities();
                string PathURL = "~/media/Signature/" + ESignature.Value;
                string Path = System.Web.Hosting.HostingEnvironment.MapPath(PathURL);
                using (Image image = Image.FromFile(Path))
                {
                    using (MemoryStream m = new MemoryStream())
                    {
                        image.Save(m, image.RawFormat);
                        byte[] imageBytes = m.ToArray();

                        // Convert byte[] to Base64 String
                        string base64String = Convert.ToBase64String(imageBytes);
                        Image img = ByteArrayToImage(Convert.FromBase64String(base64String));
                        xrPictureBox4.Image = img;
                    }
                }
            }
        }

        public Image ByteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image returnImage = Image.FromStream(ms);
            return returnImage;
        }
    }
}
