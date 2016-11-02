{config_load file="test.conf" section="setup"}

{include file="header.tpl" title=Innovakids}

<script type="text/javascript">
    
    function Loading()
          {
               
                CommonLoading();
              
                 var strschoolno = getCookie('schoolno');     
                 var strclassno = getCookie('classno'); 
                 alert(strschoolno);
                 alert(strclassno);
              
                //GetClassClassNo();
              
                //LoadSubject();
                //LoadClassType();
                //LoadTeacher();
                //LoadClassLevel();
          }
    
    
   </script> 
       
          
   
        

<div id="wrapper">
   
  <div class="content">

 
    <div class="container">
        
        <div class="row">
                   
            
          <div class="col-md-3 col-sm-6">
   
              
            <div class="portlet">
                <h4 class="portlet-title">
                    <u>Class View</u>
                </h4> 
                
              <!-- Info Panel  -->
              <h4 class="portlet-title">
                  
        
                  
                    <label for="UserName"  id="UserName" style="font-size:12px;color:black;font-weight:normal">User: {$UserName}</label>                     <br />
                    
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
              
              </h4> 
                        
             
              <div class="list-group">  
               
              <a href="smart_admin_classes.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Classes
              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfClasses}</span>
              </a>
               <a href="smart_admin_classevents.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Class Events
              <i class="fa fa-chevron-right list-group-chevron"></i>
              </a>      
              
              <a href="smart_account_classlessons.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Active Lessons

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfActiveLessons}</span>
            </a> 
                <a href="smart_account_classlessons.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;All Lessons

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfClassLessons}</span>
            </a> 
              <a href="smart_admin_parents.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Active Parents

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfParents}</span>
            </a> 
             
              <a href="smart_admin_students.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Students

             <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfStudents}</span>
            </a> 
               <a href="smart_admin_students.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Schools

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfSchools}</span>
            </a> 
              <a href="smart_admin_schoolschedule.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;School Schedule

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfEvents}</span>
            </a> 
            </div> 
                 <h4 class="portlet-title">
                    <u>Subject News</u>
                </h4> 
             <div class="list-group">      
                  {$NewsFeeds}
               </div>  
                
        </div>
    </div>
    
    
    
                    <!-- Right Column -->
                     <!-- Basic Details -->
    
                  <a href="smart_admin_classes.php" class="btn btn-secondary"><< Back</a>&nbsp;&nbsp;
                   
                <a href="index.php" class="btn btn-secondary">Home</a>
                &nbsp;&nbsp;
                <a href="smart_account_classedit.php" class="btn btn-secondary">Edit Class</a>
                &nbsp;&nbsp;
               </h4>    

               <label for="class-codetitle"  id="class-codetitle" style="font-size:18px"></label>

             
              <hr>
              
               <table  style="width:700px">  
                    <tr>
                      <td style="width:40%"> 
                 
                                {$ClassImage}   
                                      
                                
                                
                       </td>
                             <td style="width:60%">  
                    <ul class="icons-list">
                        <li> Class #: <label  id="class-teacher" >{$classno}</label></li>
                        <li> Subject: <label  id="class-subject" >{$subject}</label></li>
                        <li> Class Code: <label  id="class-teacher" >{$code}</label></li>
                        <li> Ext. Code: <label  id="class-extendedcode" ></label></li>
                        <li>   Title: <label  id="class-teacher" >{$class}</label></li>
                        <li> Teacher: <label  id="class-teacher" >{$teacher}</label></li>
                        <li> Room: <label  id="class-room" >{$room}</label></li>
                         </td>
                      </tr>             
     </table>                                 
                                 
                                 
                                 
    <table  style="width:700px">
        </ul>
                        <tr>
                            <td style="width:50%">                  
                         <ul class="icons-list">
                        <li><i class="icon-li fa fa-clock-o"></i> Beg Time: <label id="class-begtime" >{$begtime}</label></li>
                        <li><i class="icon-li fa fa-clock-o"></i> End Time: <label id="class-endtime" >{$endtime}</label></li>
                        <li><i class="icon-li fa fa-calendar"></i> Enroll By: <label id="class-enrollmentdate" ></label></li>
                        <li><i class="icon-li fa fa-calendar"></i> Start Date: <label id="class-startdate" ></label></li> 
                        <li><i class="icon-li fa fa-calendar"></i> End Date: <label id="class-enddate" ></label></li> 
                          <li><i class="icon-li fa fa-calendar"></i> Department: <label id="class-department" ></label></li> 
 <li><i class="icon-li fa fa-info"></i><input type="checkbox" name="class-active" id="class-active" disabled="disabled" >  Active</li> 
                         <li><i class="icon-li fa fa-calendar"></i> Year: <label id="class-classyears" ></label></li>
                         <li><i class="icon-li fa fa-calendar"></i> Term: <label id="class-semester" ></label></li>
                        <li><i class="icon-li fa fa-calendar"></i> Level #: <label id="class-levelno" ></label></li>
                          <li><i class="icon-li fa fa-calendar"></i> Class Type: <label id="class-classtype" >{$classtype}</label></li>
                    </ul>
   </td>
                             <td style="width:50%">
                    <ul class="icons-list">
        

                        <li><i class="icon-li fa fa-suitcase"></i> Level: <label id="class-classlevel" ></label></li>
                        <li><i class="icon-li fa fa-star"></i> Units: <label id="class-units" ></label></li>
                        <li><i class="icon-li fa fa-unlock-alt"></i> Status: <label id="class-status" ></label></li>
                        <li><i class="icon-li fa fa-building-o"></i> Period: <label id="class-period" >{$period}</label></li>
                         <li><i class="icon-li fa fa-info"></i> Type: <label id="class-classtype" >{$classtype}</label></li>
                           <li><i class="icon-li fa fa-star"></i> Avg %: <label id="class-percentage" ></label></li>
                                                 <li><i class="icon-li fa fa-building-o"></i> Current Enrollment: <label id="class-currentenrollment" >{$currentenrollment}</label></li>
                         <li><i class="icon-li fa fa-building-o"></i> Max Enrollment: <label id="class-maxenrollment" ></label></li>
                         <li><i class="icon-li fa fa-info"></i> Location: <label id="class-locationno" >{$location}</label></li>
                         <li><i class="icon-li fa fa-info"></i> Fee: <label id="class-fee" >{$fee}</label></li>

                    </ul>
                     </tr>
                    </table>
      
       <h5>Class Description:</h5>
                   <p style="padding-left: 50px">
                       <label id="class-description" > {$classdescription}</label>
                   </p>
      
       <h5>Class Notes:</h5>
                   <p style="padding-left: 50px">
                       <label id="class-notes" > {$classnotes}</label>
                   </p>
      
                </div>
               
              
               <hr>
               
               
              <hr>
               
             
    
    
      <h4 class="content-title"><u>{$class} News around the World</u></h4>

             <ul class="icons-list">
                 {$DiscussionFeeds}
               
                </ul>
           
                <!-- End Basic Details -->

                
                <!-- End Right Column -->
    
    
    
    
    
  </div>
</div>
</div>                


<!-- Plugin JS -->

<script src="./js/libs/jquery-1.10.2.min.js"></script>
<script src="./js/libs/bootstrap.min.js"></script>

<!--[if lt IE 9]>
<script src="./js/libs/excanvas.compiled.js"></script>
<![endif]-->


<!-- App JS -->
<script src="./js/mvpready-core.js"></script>
<script src="./js/mvpready-admin.js"></script>


{include file="footer.tpl"}
