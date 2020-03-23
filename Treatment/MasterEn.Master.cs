using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment
{
    public partial class MasterEn : System.Web.UI.MasterPage
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadBreadcrumb();
            LoadMenu();
        }

        private void LoadBreadcrumb()
        {
            string str = "<li class='breadcrumb-item'><a href = 'index.html'><i class='feather icon-home'></i></a></li>";
            for (int i = 0; i <3; i++)
            {
                str += "<li class='breadcrumb-item'><a href='#'>Leve " + i + "</a> </li>";
            }
            breadcrumb.Text = str;
        }

        private void LoadMenu()
        {
            List<Permission> Permission_List = db.Permissions.ToList();
            string str = string.Empty;
            try
            {
                str += "<ul class='pcoded-item pcoded-left-item'>";
                str += "<li class=''>";
                str += "<a href = '../../../../'> ";
                str += "<span class='pcoded-micon'><i class='feather icon-home'></i></span>";
                str += "<span class='pcoded-mtext'>Dashboard</span>";
                str += "</a>";
                str += "</li>";
                for (int First_Level = 0; First_Level < Permission_List.Count; First_Level++)
                {
                    if (Permission_List[First_Level].Parent == 0)
                    {
                        List<Permission> Second_Permission_List = Permission_List.Where(x => x.Parent == Permission_List[First_Level].Permission_Id).ToList();
                        str += "<li class='pcoded-hasmenu active pcoded-trigger'>";
                        str += "<a href = 'javascript:void(0)'> ";
                        str += "<span class='pcoded-micon'><i class='feather icon-mail'></i></span>";
                        str += "<span class='pcoded-mtext'>" + Permission_List[First_Level].Permission_Name_En + "</span>";
                        str += "</a>";
                        str += "<ul class='pcoded-submenu'>";

                        for (int Second_Level = 0; Second_Level < Second_Permission_List.Count; Second_Level++)
                        {
                            List<Permission> Third_Permission_List = Permission_List.Where(x => x.Parent == Second_Permission_List[Second_Level].Permission_Id).ToList();
                            if (Third_Permission_List.Count == 0)
                            {
                                str += "<li class=''>";
                                str += "<a href = '../../../../../" + Second_Permission_List[Second_Level].Url_Path + "'> ";
                                str += "<span class='pcoded-mtext'>" + Second_Permission_List[Second_Level].Permission_Name_En + "</span>";
                                str += "</a>";
                                str += "</li>";
                            }
                            else
                            {
                                str += "<li class=' pcoded-hasmenu'>";
                                str += "<a href = 'javascript:void(0)'> ";
                                str += "<span class='pcoded-mtext'>" + Second_Permission_List[Second_Level].Permission_Name_En + "</span>";
                                str += "</a>";
                                str += "<ul class='pcoded-submenu'>";
                                for (int Third_Level = 0; Third_Level < Third_Permission_List.Count; Third_Level++)
                                {
                                    str += "<li class=''>";
                                    str += "<a href = '../../../../../" + Third_Permission_List[Third_Level].Url_Path + "'> ";
                                    str += "<span class='pcoded-mtext'>" + Third_Permission_List[Third_Level].Permission_Name_En + "</span>";
                                    str += "</a>";
                                    str += "</li>";
                                }
                                str += "</ul>";
                                str += "</li>";
                            }

                            str += "</ul>";
                            str += "</li>";
                        }
                    }
                }
                str += "</ul>";
            }

            catch { }
            Menu.Text = str;
        }
    }
}