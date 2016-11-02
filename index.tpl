{config_load file="test.conf" section="setup"}

{include file="header.tpl" title=Innovakids}

<script language="javascript">

if(getCookie("schoolno") == "" ){

 
  alert("Login not Valid.  Try again!"); 
 
  //window.location="smart_admin_login.php";
  
     
}

   var today = new Date();
          var expiry = new Date(today.getTime() + 30 * 24 * 3600 * 1000); // plus 30 days

          function setCookie(name, value)
          {

            document.cookie=name + "=" + escape(value) + "; path=/; expires=" + expiry.toGMTString();
          }

        
          function getCookie(name)
         {

                
                
                if (document.cookie.length>0)
                {
                  c_start=document.cookie.indexOf(name + "=");
                  if (c_start != -1)
                    {
                    c_start=c_start + name.length+1;
                    c_end=document.cookie.indexOf(";",c_start);
                    if (c_end==-1) c_end=document.cookie.length;


                        return  unescape(document.cookie.substring(c_start,c_end));
                    }
                  }
                return "";
          }     



</script>


<div id="wrapper">
   
  <div class="content">

 
    <div class="container">
        
        <div class="row">
                   
            
          <div class="col-md-3 col-sm-6">
   
              
            <div class="portlet">
                <h4 class="portlet-title">
                     <img alt="" src="images/innovakids.png"  width="150" height="25" align="left">
                    <u>Admin Dashboard</u>
                </h4> 
                
              <!-- Info Panel  -->
              <h4 class="portlet-title">
   
                 <div class="profile-avatar">
            <img src="images/school1.jpg" class="profile-avatar-img thumbnail" width="150" Height="150" alt="Profile Image">
          </div> <!-- /.profile-avatar -->
                  
                    <label for="UserName"  id="UserName" style="font-size:12px;color:black;font-weight:normal">User: {$UserName} ({$TeacherNo})</label>  <br /> <a href="smart_admin_profile.php">My Profile<i class="fa fa-external-link"></i></a>
                       <br /><br />
                    
                    <label for="Year" id="Year"  style="font-size:12px;color:black;font-weight:normal">School Year:</label><br />
                    <select id="class-classlevel-select" name="class-classlevel-select" class="class-classlevel form-control parsley-validated" data-required="true"  onchange="javascript:YearChangeEvent(this);">
                          {html_options values=$year_values selected=$year_selected output=$year_output}
                    </select>
                  <br />
                   <label for="Term" id="Term"  style="font-size:12px;color:black;font-weight:normal">Term:</label><br />
                    <select name=Term Width="200" class="class-teacher form-control parsley-validated" data-required="true"  onchange="javascript:TermChangeEvent(this);">
                          {html_options values=$term_values selected=$term_selected output=$term_output}
                    </select>
                  <br />
                  <label for="School" id="School" style="font-size:12px;color:black;font-weight:normal">Select School:</label><br />
                    <select name=School  Width="200"  name="class-teacher-select" class="class-teacher form-control parsley-validated" data-required="true" onchange="javascript:SchoolNoChangeEvent(this);">
                          {html_options values=$school_values selected=$school_selected output=$school_output}
                    </select>
                  <br />
                 
              </h4> 
                        
             
              <div class="list-group">  
              <a href="smart_admin_classes.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;School Events
              <i class="fa fa-chevron-right list-group-chevron"></i>
              </a>  
              <a href="smart_admin_classes.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Classes
              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfClasses}</span>
            </a> 
                 </a> 
              <a href="smart_account_activelessons.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Active Lessons

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfActiveLessons}</span>
            </a> 
               </a> 
              <a href="smart_admin_parents.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Active Parents

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfParents}</span>
            </a> 
             </a> 
              <a href="smart_admin_students.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Students

             <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfStudents}</span>
            </a> 
               <a href="smart_admin_schools.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Schools

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfSchools}</span>
            </a> 
              <a href="account-schoolschedule.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;School Schedule

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfEvents}</span>
            </a> 
            
            </div> 
          <div class="list-group">      
             {$NewsFeeds}     
               </div> 
        </div>
    </div>
    
    
    
     <div class="col-md-8 col-sm-7">
           <div class="portlet">

               
                <h4 class="content-title"><u>{$SchoolName} ({$SchoolNo}) - {$DistrictName}</u></h4>
                <h4 class="content-title"><u>School Event Reminders</u></h4>

               
             <ul class="icons-list">
                  {$SchoolEventFeeds}

             </ul>
             <a href="smart_admin_schoolevent.php">Read More &nbsp;<i class="fa fa-external-link"></i></a>
          <hr>


          
               
               
       <h4 class="content-title"><u>Recent Activity</u></h4>

            <div class="well">


              <ul class="icons-list text-md">

                
                  {$TeacherActivityFeeds}
                  
                  
              </ul>
 <a href="smart_admin_recentactivity.php">Read More &nbsp;<i class="fa fa-external-link"></i></a>
            </div> <!-- /.well -->


                    <h4 class="content-title"><u>World Wide Subject Discussions</u></h4>

       
             <ul class="icons-list">
                 {$SubjectFeeds}
               
          <hr>
                  <h4 class="content-title"><u>Your Class Discussions</u></h4>
                    <ul class="icons-list"> 
                       {$ClassFeeds}
                
                </ul>
             <a href="smart_admin_subjectdiscussions.php.html">Read More &nbsp;<i class="fa fa-external-link"></i></a>
          <hr>

              
              
       
               
        <div class="portlet-body">
        
            
           <h4 class="portlet-title">
                  <u>School Overview</u>
                </h4>
                <table class="table keyvalue-table">
                  <tbody>
                    <tr>
                      <td class="kv-key"><i class="fa fa-gift kv-icon kv-icon-secondary"></i><a href="mainmenu.html" > Registered</a></td>
                      <td class="kv-value">653 </td>
                    </tr>
                    <tr>
                      <td class="kv-key"><i class="fa fa-gift kv-icon kv-icon-secondary"></i><a href="mainmenu.html" > Enrolled this Term</a></td>
                      <td class="kv-value">473 </td>
                    </tr>
                    <tr>
                      <td class="kv-key"><i class="fa fa-gift kv-icon kv-icon-secondary"></i><a href="mainmenu.html" >Active Classes</a></td>
                      <td class="kv-value">78</td>
                    </tr>
                    <tr>
                      <td class="kv-key"><i class="fa fa-envelope-o kv-icon kv-icon-default"></i><a href="mainmenu.html" >Unread Messages</a> </td>
                      <td class="kv-value">39 </td>
                    </tr>
                  </tbody>
                </table>
  
        </div> <!-- /.portlet-body -->

      </div> <!-- /.portlet -->

          </div> <!-- /.col -->
    
    
    
    
    
  </div>
</div>
</div>                




{include file="footer.tpl"}
