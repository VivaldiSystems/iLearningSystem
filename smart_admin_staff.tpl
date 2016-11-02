{config_load file="test.conf" section="setup"}

{include file="header.tpl" title=Innovakids}



<div id="wrapper">
   
  <div class="content">

 
    <div class="container">
        
        <div class="row">
                   
            
          <div class="col-md-3 col-sm-6">
   
              
            <div class="portlet">
                <h4 class="portlet-title">
                    <u>Staff Search</u>
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
               <a href="smart_admin_schoolevents.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;School Events
              <i class="fa fa-chevron-right list-group-chevron"></i>
              </a>      
              
              <a href="smart_account_activelessons.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Active Lessons

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
               <a href="smart_admin_schools.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;Schools

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfSchools}</span>
            </a> 
              <a href="account-schoolschedule.php" class="list-group-item">
              <i class="fa fa-cog text-primary"></i> &nbsp;&nbsp;School Schedule

              <i class="fa fa-chevron-right list-group-chevron"></i><span class="badge">{$NumberOfEvents}</span>
            </a> 
            </div> 
        </div>
    </div>
    
    
    
                    <!-- Right Column -->
          <div class="col-md-9 col-sm-9">
              
            <div class="portlet">

                    <!-- Column Header -->
                 <h3 class="portlet-title">
                    
                    <a href="index.php" class="fa fa-bars" style="font-size:16px" >Home</a>&nbsp;&nbsp;
                    <a href="account-classadd.php" class="fa fa-bars" style="font-size:16px" >Add New Class</a>&nbsp;&nbsp;
                    <a href="account-classes-Advanced.php" class="fa fa-bars" style="font-size:16px" >Advanced View</a>&nbsp;&nbsp;
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-help" href="#faq-general-1">                      <label for="UserName"  id="UserName" style="font-size:12px"> Advanced Search</label></a>
                </h3>
                    <!-- End Column Header -->
                    
                    <!-- Advanced Search -->
                <div class="panel">
           

                    <div id="faq-general-1" class="panel-collapse collapse">

                        <div class="panel-body">

                            <p class="advanced-search"> 

                                <div class="advanced-search row">

                                    <!-- div for centering 
                                    <div class="col-md-1">
                                    </div>
                                    -->
                                    <!-- Column 1 -->
                                    <div class="col-md-4 col-sm-6">
                                        
                                        <div class="row">
                                            
                                            <div class="advanced-search col-md-6 col-sm-12">   

                                                <label id="class-classno-label"  style="font-size:12px">Class #:</label><br />
                                                <input type="text" style="width: 100%;" id="class-classno" placeholder="Class #" tabindex="2"  >

                                                <br />

                                                <label id="class-room-label"  style="font-size:12px">Room:</label><br />
                                                <input type="text"  id="class-room" style="width: 100%;" placeholder="Room" tabindex="2"  >

                                                <br/>

                                            </div>
                                            
                                            <div class="advanced-search col-md-6 col-sm-12">  

                                                <label id="class-period-label"  style="font-size:12px">Period:</label><br />
                                                <input type="text"  id="class-period" style="width: 100%;" placeholder="Period" tabindex="2"  >
                                                <br />

                                                <label id="class-code-label"  style="font-size:12px">Code:</label><br />
                                                <input type="text"  id="class-code" style="width: 100%;" placeholder="Code" tabindex="2"  >

                                            </div>
                                            
                                        </div>
                                        
                                        <div class="row">
                                            <div class="advanced-search col-sm-12">
                                                <label id="class-dayfrequency-label"  style="font-size:12px">Day Freq:</label><br />
                                                <input type="text"  id="class-dayfrequency" style="width: 100%;" placeholder="Day Frequency" tabindex="2"  >

                                                <br />
                                                
                                                <label id="class-description-label"  style="font-size:12px">Class Desc.:</label><br />
                                                <input type="text-box"  id="class-description" placeholder="Class Desc." style="width: 100%;" tabindex="2"  >
                                                
                                            </div>
                                        
                                        </div>

                                    </div>
                                    <!-- Column 2 -->
                                    <div class="advanced-search col-md-4 col-sm-6">   

                                         <label id="class-status-label"  style="font-size:12px">Status:</label><br />
                                        <select id="class-status-select" name="class-status-select" class="class-status form-control parsley-validated" data-required="true" onchange="javascript:UpdateCookie(this);">
                                            <option value="null" selected></option>
                                            <option value="open">Open</option>
                                            <option value="closed">Closed</option>
                                            <option value="full">Full</option>
                                            <option value="waitlisted">Waitlisted</option>
                                            <option value="cancelled">Cancelled</option>                                            
                                        </select>

                                        <label id="class-classlevel-label"  style="font-size:12px">Level:</label><br />
                                        <select id="class-classlevel-select" name="class-classlevel-select" class="class-classlevel form-control parsley-validated" data-required="true" onchange="javascript:UpdateCookie(this);">
                         {html_options values=$classlevel_values selected=$classlevel_selected output=$classlevel_output}                     
                                        </select>   

                                        <label id="class-teacher-label"  style="font-size:12px">Teacher:</label><br />
                                       
 <select name="class-teacher-select"  class="class-teacher form-control parsley-validated" data-required="false"  onchange="javascript:UpdateCookie(this);">
                                {html_options values=$teacher_values selected=$teacher_selected output=$teacher_output}
                                        </select>

                                    </div>
                                    
                                    <!-- Column 3-->
                                    <div class="advanced-search col-md-4 col-sm-6">  

                                        <label id="class-subject-label"  style="font-size:12px">Subject:</label><br />
                                        <select id="class-subject-select" name="class-subject-select" class="class-subject form-control parsley-validated" data-required="true" onchange="javascript:UpdateCookie(this);">
                        {html_options values=$subject_values selected=$subject_selected output=$subject_output}
                                        </select>

                                        <label id="class-classtype-label"  style="font-size:12px">Class Type:</label><br />
                                        <select id="class-classtype-select" name="class-classtype-select" class="class-classtype form-control parsley-validated" data-required="true" onchange="javascript:UpdateCookie(this);">
                         {html_options values=$classtype_values selected=$classtype_selected output=$classtype_output}                                                 </select>

                                       
                                    </div>

                                </div>

                                <!-- Search Button  (Not sure how to center this without center tags)-->
                                <center><a href="smart_admin_classes.php" class="btn btn-secondary" style="margin-top: 10px">Search</a></center>

                            </p>
                        
                        </div>
                    
                    </div>
                
                </div> 
                    <!-- End Advanced Search -->
<style>
  table {
  color: #333;
  font-family: Helvetica, Arial, sans-serif;
  width: 640px;
   }
   
   
   td, th { border: 1px solid transparent; 
   height: 30px; 
   transition: all 0.3s; 
   }
   th {
   background: #DFDFDF;  
   font-weight: bold;
   }
   td {
   background: #FAFAFA;
   text-align: center;
   }

</style>
                    <!-- Search Table -->    
                <div class="portlet-body">

           
						  
	                    {$myDatagridTable}    
                     

                </div>
                    <!-- End Search Table -->    

            </div>

          </div>
                <!-- End Right Column -->
    
    
    
    
    
  </div>
</div>
</div>                


<!-- Plugin JS -->




{include file="footer.tpl"}
