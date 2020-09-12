using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using Website.Classes;
using System.IO;

namespace Treatment.Pages.Eminutes.Reports
{
    public partial class Minutes : DevExpress.XtraReports.UI.XtraReport
    {
        public Minutes()
        {
            InitializeComponent();
        }

        private void xrLabel17_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void xrPictureBox4_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            if (SessionWrapper.LoggedUser.Employee_Signature != null && SessionWrapper.LoggedUser.Employee_Signature != "")
            {
                string PathURL = "~/media/Signature/" + SessionWrapper.LoggedUser.Employee_Signature;
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
