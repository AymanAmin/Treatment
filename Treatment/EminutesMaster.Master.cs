using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment
{
    public partial class EminutesMaster : System.Web.UI.MasterPage
    {
        ECMSEntities db = new ECMSEntities();
        Permission CurrentPageNow = new Permission();
        List<int> CurrentPageSequences = new List<int>();
        bool isDashBoard = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IsECMS"] = false;
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            string path_and_query = HttpContext.Current.Request.Url.PathAndQuery;

            path_and_query = HttpUtility.UrlEncode(path_and_query);
            txtlockscreen.Text = "<a  href='../../../../Pages/Setting/Auth/LockScreen.aspx?URL=" + path_and_query + "'>" +
                                                        "<i class='feather icon-lock'></i> " + FieldNames.getFieldName("Master-LockScreen", "Lock Screen") +
                                                    "</a>";

            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                Style.Text = FieldNames.getSTyleRTL();
                StyleEminutes.Text = FieldNames.getSTyleRTLEminutes();
                //Script.Text = FieldNames.getJavaScriptRTL();
                //this.html.Attributes.Add("dir", "ltr");
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "RTL_Layout();", true);
            }

            if (!IsPostBack)
            {
                List<Permission> Permission_List = new List<Permission>();
                List<Permission_Group> Per_group = db.Permission_Group.Where(x => x.Group_Id == SessionWrapper.LoggedUser.Group_Id).ToList();
                Permission_List.Clear();
                for (int j = 0; j < Per_group.Count; j++)
                {
                    int per_id = (int) Per_group[j].Permission_Id;
                    Permission per = db.Permissions.Where(x => x.Permission_Id == per_id && x.System_Id != 2).FirstOrDefault();
                    if (per != null)
                        Permission_List.Add(per);
                }
                List<M_Board> ListBoardTemp = db.M_Board.ToList();
                List<M_Board> ListBoard = new List<M_Board>();
                for (int i = 0; i < ListBoardTemp.Count;i++)
                {
                    M_Board_Member BM = ListBoardTemp[i].M_Board_Member.Where(x => x.Employee_Id == SessionWrapper.LoggedUser.Employee_Id).FirstOrDefault();
                    if (BM != null)
                        ListBoard.Add(ListBoardTemp[i]);
                }

                Employee_Name();
                MargeBoardToMenu(Permission_List, ListBoard);
                


            }
        }

        private void Employee_Name()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
                Emp_Name.Text = SessionWrapper.LoggedUser.Employee_Name_Ar;
            else
                Emp_Name.Text = SessionWrapper.LoggedUser.Employee_Name_En;
        }


        private void MargeBoardToMenu(List<Permission> Permission_List, List<M_Board> ListBoard)
        {
            // Main Boards 
            Permission MainBoards = new Permission();
            MainBoards.Permission_Id = -200000000;
            MainBoards.Permission_Name_Ar = "مجالس";
            MainBoards.Permission_Name_En = "Boards";
            MainBoards.Parent = 0;
            MainBoards.Permission_Icon = "icofont icofont-billboard";
            Permission_List.Add(MainBoards);

            // Branch Boards 
            Permission BranchBoards = new Permission();
            BranchBoards.Permission_Id = -100000000;
            BranchBoards.Permission_Name_Ar = "اللجان";
            BranchBoards.Permission_Name_En = "Committees";
            BranchBoards.Parent = 0;
            BranchBoards.Permission_Icon = "icofont icofont-chart-flow";
            Permission_List.Add(BranchBoards);

            for (int i = 0; i < ListBoard.Count; i++)
            {
                Permission per = new Permission();
                per.Permission_Name_Ar = ListBoard[i].Board_Name_Ar;
                per.Permission_Name_En = ListBoard[i].Board_Name_En;
                
                if(ListBoard[i].Board_Type_Id == 1)
                    per.Permission_Id = ListBoard[i].Board_Id - 100000;
                else
                    per.Permission_Id = ListBoard[i].Board_Id - 200000;
                per.Url_Path = "../../../../Pages/Eminutes/Board.aspx?BoardId=" + ListBoard[i].Board_Id;
                if (ListBoard[i].Parent == 0)
                {
                    if(ListBoard[i].Board_Type_Id == 1)
                        per.Parent = -200000000;
                    else
                        per.Parent = -100000000;
                }
                else if (ListBoard[i].Board_Type_Id == 1)
                    per.Parent = ListBoard[i].Parent - 100000;
                else
                    per.Parent = ListBoard[i].Parent - 200000;

                per.Permission_Icon = "Its_Board";
                Permission_List.Add(per);
            }
            Permission_List = Permission_List.OrderBy(x => x.Permission_Id).ToList();

            LoadBreadcrumb(Permission_List);
            LoadMenu(Permission_List);
            
        }

        private void LoadBreadcrumb(List<Permission> ListPermission)
        {
            string str = "<li class='breadcrumb-item'><a href = '~/'><i class='feather icon-home'></i></a></li>";

            List<string> breadcrumbs = new List<string>();

            string Current_PageName = "Home";
            if (SessionWrapper.LoggedUser.Language_id == 1)
                Current_PageName = "الرئيسية";

            string LocalPath = String.Concat(HttpContext.Current.Request.Url.LocalPath.Skip(1));
            int found = LocalPath.IndexOf(".aspx");
            LocalPath = LocalPath.Substring(0, found + 5);

            if (LocalPath == "default.aspx")
                isDashBoard = true;

            try
            {
                Permission CurrentPage = CurrentPageNow = ListPermission.Where(x => x.Url_Path == LocalPath).First();

                if (CurrentPage != null)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        Current_PageName = CurrentPage.Permission_Name_Ar;
                    else
                        Current_PageName = CurrentPage.Permission_Name_En;
                    do
                    {
                        //Add id for currnet sequense to set menu as active
                        CurrentPageSequences.Add(CurrentPage.Permission_Id);

                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            breadcrumbs.Add(CurrentPage.Permission_Name_Ar);
                        else
                            breadcrumbs.Add(CurrentPage.Permission_Name_En);

                        CurrentPage = ListPermission.Where(x => x.Permission_Id == CurrentPage.Parent).First();
                    }
                    while (CurrentPage.Parent != 0);
                    //Add Last Id (the Perant Id for list
                    CurrentPageSequences.Add(CurrentPage.Permission_Id);

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        breadcrumbs.Add(CurrentPage.Permission_Name_Ar);
                    else
                        breadcrumbs.Add(CurrentPage.Permission_Name_En);



                    for (int i = breadcrumbs.Count - 1; i > 0; i--)
                    {
                        str += "<li class='breadcrumb-item'><a href='#'> " + breadcrumbs[i] + "</a> </li>";
                    }
                }
                PageName.Text = Current_PageName;
                breadcrumb.Text = str;
            }
            catch { breadcrumb.Text = str; PageName.Text = Current_PageName; }
        }

        private void LoadMenu(List<Permission> Permission_List)
        {

            string str = string.Empty;
            try
            {
                str += "<ul class='pcoded-item pcoded-left-item'>";
                /*str += "<li class=''>";
                str += "<a href = '../../../../Pages/Eminutes/Home.aspx' > ";
                str += "<span class='pcoded-micon active' style='color:#452a74'><i class='feather icon-home'></i></span>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<span class='pcoded-mtext'>الرئيسية</span>";
                else
                    str += "<span class='pcoded-mtext'>Home</span>";

                str += "<span class='pcoded-mcaret'></span>";
                str += "</a>";
                str += "</li>";*/

                for (int First_Level = 0; First_Level < Permission_List.Count; First_Level++)
                {
                    if (Permission_List[First_Level].Parent == 0)
                    {
                        //if (CurrentPageSequences.Contains(Permission_List[First_Level].Permission_Id) || (isDashBoard && First_Level == 0))
                        //    str += "<li id='" + Permission_List[First_Level].Permission_Id + "' class='pcoded-hasmenu pcoded-trigger'>";
                        //else
                            str += "<li id='" + Permission_List[First_Level].Permission_Id + "' class='pcoded-hasmenu'>";

                        // Make diffrent between Menu and board from MargeBoardToMenu function
                        if (Permission_List[First_Level].Permission_Icon != "Its_Board")
                            str += "<a href = 'javascript:void(0)'>";
                        else
                            str += "<a href = '"+ Permission_List[First_Level].Url_Path + "'>";

                        str += "<span class='pcoded-micon'><i class='" + Permission_List[First_Level].Permission_Icon + "'></i></span>";
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            str += "<span class='pcoded-mtext'>" + Permission_List[First_Level].Permission_Name_Ar + "</span>";
                        else
                            str += "<span class='pcoded-mtext'>" + Permission_List[First_Level].Permission_Name_En + "</span>";

                        str += "<span class='pcoded-mcaret'></span>";
                        str += "</a>";
                        str += "<ul class='pcoded-submenu'>";
                        List<Permission> Second_List = Permission_List.Where(x => x.Parent == Permission_List[First_Level].Permission_Id).ToList();
                        for (int Second_Level = 0; Second_Level < Second_List.Count; Second_Level++)
                        {
                            List<Permission> Third_List = Permission_List.Where(x => x.Parent == Second_List[Second_Level].Permission_Id).ToList();
                            if (Third_List.Count > 0)
                            {
                                if (CurrentPageSequences.Contains(Second_List[Second_Level].Permission_Id))
                                    str += "<li id='" + Second_List[Second_Level].Permission_Id + "' class='pcoded-hasmenu pcoded-trigger'>";
                                else
                                    str += "<li id='" + Second_List[Second_Level].Permission_Id + "' class='pcoded-hasmenu'>";

                                // Make diffrent between Menu and board from MargeBoardToMenu function
                                if (Second_List[Second_Level].Permission_Icon != "Its_Board")
                                    str += "<a href = 'javascript:void(0)'>";
                                else
                                    str += "<a href = '" + Second_List[Second_Level].Url_Path + "'>";

                                str += "<span class='pcoded-micon'><i class='" + Second_List[Second_Level].Permission_Icon + "'></i></span>";
                                if (SessionWrapper.LoggedUser.Language_id == 1)
                                    str += "<span class='pcoded-mtext'>" + Second_List[Second_Level].Permission_Name_Ar + "</span>";
                                else
                                    str += "<span class='pcoded-mtext'>" + Second_List[Second_Level].Permission_Name_En + "</span>";
                                str += "</a>";
                                str += "<ul class='pcoded-submenu'>";
                                for (int Third_Level = 0; Third_Level < Third_List.Count; Third_Level++)
                                {
                                    if (CurrentPageNow.Permission_Id == Third_List[Third_Level].Permission_Id)
                                        str += "<li class='active'>";
                                    else
                                        str += "<li class=''>";
                                    str += "<a href = '../../../../" + Third_List[Third_Level].Url_Path + "' > ";
                                    str += "<span class='pcoded-micon'><i class='" + Third_List[Third_Level].Permission_Icon + "'></i></span>";
                                    if (SessionWrapper.LoggedUser.Language_id == 1)
                                        str += "<span class='pcoded-mtext'>" + Third_List[Third_Level].Permission_Name_Ar + "</span>";
                                    else
                                        str += "<span class='pcoded-mtext'>" + Third_List[Third_Level].Permission_Name_En + "</span>";

                                    str += "<span class='pcoded-mcaret'></span>";
                                    str += "</a>";
                                    str += "</li>";
                                }
                                str += "</ul>";
                                str += "</li>";
                            }
                            else
                            {
                                if (CurrentPageNow.Permission_Id == Second_List[Second_Level].Permission_Id)
                                    str += "<li class='active'>";
                                else
                                    str += "<li class=''>";
                                str += "<a href = '../../../../" + Second_List[Second_Level].Url_Path + "' > ";
                                str += "<span class='pcoded-micon'><i class='" + Second_List[Second_Level].Permission_Icon + "'></i></span>";
                                if (SessionWrapper.LoggedUser.Language_id == 1)
                                    str += "<span class='pcoded-mtext'>" + Second_List[Second_Level].Permission_Name_Ar + "</span>";
                                else
                                    str += "<span class='pcoded-mtext'>" + Second_List[Second_Level].Permission_Name_En + "</span>";

                                str += "<span class='pcoded-mcaret'></span>";
                                str += "</a>";
                                str += "</li>";
                            }
                        }
                        str += "</ul>";
                        str += "</li>";
                    }
                }
                str += "<ul class='pcoded-item pcoded-left-item'>";
                str += "<li class=''>";
                str += "<a href = '../../../../Pages/Setting/Auth/Logout.ashx' > ";
                str += "<span class='pcoded-micon active' style='color:#452a74'><i class='icofont icofont-logout'></i></span>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<span class='pcoded-mtext'>تسجيل خروج</span>";
                else
                    str += "<span class='pcoded-mtext'>Logout</span>";

                str += "<span class='pcoded-mcaret'></span>";
                str += "</a>";
                str += "</li>";
                str += "</ul>";
            }
            catch { }
            Menu.Text = str;
        }

    }
}