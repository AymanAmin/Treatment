using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Eminutes.BoardManagment
{
    public partial class BoardMember : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            if (Request["BoardId"] == null)
                Response.Redirect("~/Pages/Eminutes/Home.aspx");

            if (!IsPostBack)
            {
                int board_id = int.Parse(Request["BoardId"].ToString());
                List<M_Board_Member> ListMember = db.M_Board_Member.Where(x => x.Board_Id == board_id).ToList();
                fillDropDown();
                LoadMember(ListMember , board_id);
            }
        }

        private void fillDropDown()
        {
            List<Employee> ListEmployee = db.Employees.ToList();
            List<M_Member_Type> ListMemberType = db.M_Member_Type.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                ddlFiller.dropDDL(txtEmployees, "Employee_Id", "Employee_Name_Ar", ListEmployee, "إختر عضو");
                ddlFiller.dropDDL(txtType, "Member_Type_Id", "Member_Type_Name_Ar", ListMemberType, "اختر النوع");
            }
            else
            {
                ddlFiller.dropDDL(txtEmployees, "Employee_Id", "Employee_Name_En", ListEmployee, "Select Member");
                ddlFiller.dropDDL(txtType, "Member_Type_Id", "Member_Type_Name_En", ListMemberType, "Select Type");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "";
                int board_id = int.Parse(Request["BoardId"]);
                int EmployeeId = int.Parse(txtEmployees.SelectedValue);

                // check if member exist
                M_Board_Member IsMemberExisted = db.M_Board_Member.FirstOrDefault(x => x.Board_Id == board_id && x.Employee_Id == EmployeeId);
                if (IsMemberExisted == null)
                {
                    // Create new member
                    M_Board_Member member = db.M_Board_Member.Create();
                    member.Board_Id = board_id;
                    member.Employee_Id = EmployeeId;
                    member.Member_Type_Id = int.Parse(txtType.SelectedValue);
                    db.M_Board_Member.Add(member);
                    message = "Member Added successfully..";
                }
                else
                {
                    // Update exist member
                    M_Board_Member member = db.M_Board_Member.Find(IsMemberExisted.Board_Member_Id);
                    member.Board_Id = board_id;
                    member.Employee_Id = EmployeeId;
                    member.Member_Type_Id = int.Parse(txtType.SelectedValue);
                    member.Board_Member_Id = IsMemberExisted.Board_Member_Id;
                    db.Entry(member).State = System.Data.EntityState.Modified;
                    message = "Member updated successfully..";
                }
                db.SaveChanges();
                LtrMessage.Text = "<div class='alert alert-success' role='alert'>"+ message + "</div>";

                // Reload data
                List<M_Board_Member> ListMember = db.M_Board_Member.Where(x => x.Board_Id == board_id).ToList();
                fillDropDown();
                LoadMember(ListMember , board_id);
            }
            catch { LtrMessage.Text = "<div class='alert alert-danger' role='alert'>System Error...</div>"; }
        }

        private void LoadMember(List<M_Board_Member> ListMember, int board_id)
        {
            string str = string.Empty , color = string.Empty , radialClass = string.Empty;
            
            // Order By member type
            ListMember = ListMember.OrderBy(x => x.Member_Type_Id).ToList();

            for (int i = 0; i < ListMember.Count; i++)
            {
                if (ListMember[i].Member_Type_Id == 1)
                { color = "text-c-pink"; radialClass = "radial-bar-danger"; }
                else if (ListMember[i].Member_Type_Id == 2)
                { color = "text-c-yellow"; radialClass = "radial-bar-warning"; }
                else if (ListMember[i].Member_Type_Id == 3)
                { color = "text-c-lite-green"; radialClass = "radial-bar-info"; }
                else
                { color = "text-c-green"; radialClass = "radial-bar-success"; }

                // Set Color of text black as Mazin Said
                color = "text-c-black";

                // Create Card
                str += "<div class='col-md-6 col-lg-3'>";
                str += "<div class='card'>";
                str += "<div class='card-block user-radial-card'>";
                str += "<div data-label='100%' class='radial-bar radial-bar-100 radial-bar-lg " + radialClass + "'>";
                str += "<img src = '../../../../media/Profile/" + ListMember[i].Employee.Employee_Profile + "' alt='User-Image'>";
                str += "</div>";
                str += "<br />";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<span class='f-15 " + color + "'>"+ ListMember[i].M_Member_Type.Member_Type_Name_Ar + "</span>";
                else
                    str += "<span class='f-15 " + color + "'>" + ListMember[i].M_Member_Type.Member_Type_Name_En + "</span>";
                str += "<br />";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<span class='f-20 " + color + "'>"+ ListMember[i].Employee.Employee_Name_Ar + "</span>";
                else
                    str += "<span class='f-20 " + color + "'>" + ListMember[i].Employee.Employee_Name_En + "</span>";
                List<Employee_Structure> emp_struc = ListMember[i].Employee.Employee_Structure.ToList();
                if (emp_struc.Count > 0)
                {
                    str += "<br />";
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<p  class='f-15 " + color + "'>" + emp_struc[0].Structure.Structure_Name_Ar + "</p>";
                    else
                        str += "<p  class='f-15 " + color + "'>" + emp_struc[0].Structure.Structure_Name_En + "</p>";
                }
                str += "<br />";
                //str += "<button class='btn btn-info btn-icon' type='button' data-toggle='modal' data-target='#add-model'>&nbsp;<i class='icofont icofont-edit'></i></button>&nbsp;";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<a href ='DeleteMembers.ashx?BoardId=" + board_id + "&MemberTableId="+ ListMember[i].Board_Member_Id+ "&EmpId="+ ListMember[i].Employee_Id+ "' class='btn btn-warning btn-round'>&nbsp;<i class='icofont icofont-ui-delete'> حذف </i></a>";
                else
                    str += "<a href ='DeleteMembers.ashx?BoardId=" + board_id + "&MemberTableId=" + ListMember[i].Board_Member_Id + "&EmpId=" + ListMember[i].Employee_Id + "' class='btn btn-warning btn-round'>&nbsp;<i class='icofont icofont-ui-delete'> Remove </i></a>";


                str += "</div>";
                str += "</div>";
                str += "</div>";
            }
            BoardMembers.Text = str;
        }
    }
}