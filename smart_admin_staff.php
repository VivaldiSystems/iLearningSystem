<?php
/**
 * Example Application
 *
 * @package Example-application
 */


require 'libs/Smarty.class.php';

require 'req_scripts.php';

//$_COOKIE['district'] = "WATERBABIES";



//Database Connection
$serverName = "s02.winhost.com";    
$uid = "DB_6956_innovakids_user";      
$pwd = "foll2164";     
$databaseName = "DB_6956_innovakids";    
    
$connectionInfo = array( "UID"=>$uid,                               
                         "PWD"=>$pwd,                               
                         "Database"=>$databaseName);    
     
/* Connect using SQL Server Authentication. */     
$conn = sqlsrv_connect( $serverName, $connectionInfo); 
//End Database Connection

$smarty = new Smarty;

$smarty->assign("UserName", "ADMIN" );


//$smarty->force_compile = true;
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 6;

  


/* Execute the query. */     
$tsql = "Select SchoolNo,School+' ('+convert(varchar,SchoolNo)+')' As SchoolName from School where district = '".$_COOKIE['district']."' order by District,School"; 


//echo '<script language="javascript">';
//echo 'alert("'.$tsql.'")';
// echo '</script>';


$params = array();
$options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
$stmt = sqlsrv_query( $conn, $tsql , $params, $options );

        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, 10); 

$SchoolList = array();
$SchoolNoList = array();

$SchoolNoLocal = "";


while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC))     
{     
   
    $SchoolNoList[] = $row['SchoolNo'];
    $SchoolList[] = $row['SchoolName'];
    
    $SchoolNoLocal = $row['SchoolNo'];
    
}     
    

$smarty->assign("NumberOfSchools", count($SchoolList) );

$smarty->assign("school_values", $SchoolNoList );
$smarty->assign("school_output", $SchoolList );




if($_COOKIE["schoolno"] == "" ){
    $_COOKIE['schoolno'] = $SchoolNoList[0]; 
}

$smarty->assign("school_selected", $_COOKIE['schoolno'] );

sqlsrv_free_stmt( $stmt);

/* Execute the query. */     
$tsql = "Select Distinct Year As YearID, Year from SchoolYear order by Year"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$YearList = array();
$YearIDList = array();


while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
      //echo '<option value="'.$row[0].'">'.$row[1].'</option>';
     array_push($YearIDList, $row[0] );
    array_push($YearList, $row[1] );
}     
     

$smarty->assign("Years", $YearList[0]);


$smarty->assign("year_values", $YearIDList );
$smarty->assign("year_output", $YearList );


if( $_COOKIE['schoolyear'] == "" ) {
   $_COOKIE['schoolyear'] = $YearList[0];  
}
  

$smarty->assign("year_selected", $_COOKIE['schoolyear']  );

  

sqlsrv_free_stmt( $stmt);



/* Execute the query. */     
$tsql = "Select Distinct Term As TermID,Term from SchoolTerm Order by Term"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$TermIDList = array();
$TermList = array();

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
        array_push($TermIDList, $row[0] );
        array_push($TermList, $row[1] );
}     


$smarty->assign("term_values", $TermIDList );
$smarty->assign("term_output", $TermList );

if( $_COOKIE['schoolterm'] == "" ) {
   $_COOKIE['schoolterm'] = $TermIDList[0];
    
}
$smarty->assign("term_selected", $_COOKIE['schoolterm'] );


sqlsrv_free_stmt( $stmt);

/* Execute the query. */     
$tsql = "Select District,School from School where schoolno = '".$SchoolNoLocal."'"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
    $smarty->assign("District", $row[0]);
    $smarty->assign("SchoolName", $row[1]);
   
  
}     

 $smarty->assign("SchoolNo", $_COOKIE['schoolno']);

sqlsrv_free_stmt( $stmt);

/* Execute the query. */     
$tsql = "Select Distinct TeacherNo, Name from Teacher where SchoolNo = '".$SchoolNoLocal."' order by Name"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$TeacherList = array();
$TeacherIDList = array();


array_push($TeacherIDList, "" );
array_push($TeacherList, "" );

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
      //echo '<option value="'.$row[0].'">'.$row[1].'</option>';
     array_push($TeacherIDList, $row[0] );
    array_push($TeacherList, $row[1] );
}     



$smarty->assign("teacher_values", $TeacherIDList );
$smarty->assign("teacher_output", $TeacherList );


if( $_COOKIE['class-teacher-select'] != "" ) {
  $smarty->assign("teacher_selected", $_COOKIE['class-teacher-select']  );
}
  



sqlsrv_free_stmt( $stmt);

//**************************************************************

/* Execute the query. */     
$tsql = "Select Distinct SubjectNo, Subject from Subject where SchoolNo = '".$SchoolNoLocal."' order by Subject"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$SubjectIDList = array();
$SubjectList = array();

array_push($SubjectIDList, "" );
array_push($SubjectList, "" );

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
      //echo '<option value="'.$row[0].'">'.$row[1].'</option>';
     array_push($SubjectIDList, $row[0] );
    array_push($SubjectList, $row[1] );
}     



$smarty->assign("subject_values", $SubjectIDList );
$smarty->assign("subject_output", $SubjectList );


if( $_COOKIE['class-subject-select'] != "" ) {
  $smarty->assign("subject_selected", $_COOKIE['class-subject-select']  );
}
  

sqlsrv_free_stmt( $stmt);

//**************************************************************

/* Execute the query. */     
$tsql = "Select Distinct Code, Description from ClassType where SchoolNo = '".$SchoolNoLocal."' order by Description"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$ClassTypeIDList = array();
$ClassTypeList = array();

array_push($ClassTypeIDList, "" );
array_push($ClassTypeList, "" );

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
      //echo '<option value="'.$row[0].'">'.$row[1].'</option>';
     array_push($ClassTypeIDList, $row[0] );
    array_push($ClassTypeList, $row[1] );
}     



$smarty->assign("classtype_values", $ClassTypeIDList );
$smarty->assign("classtype_output", $ClassTypeList );


if( $_COOKIE['class-classtype-select'] != "" ) {
  $smarty->assign("classtype_selected", $_COOKIE['class-classtype-select']  );
}
  

sqlsrv_free_stmt( $stmt);

//**************************************************************

/* Execute the query. */     
$tsql = "Select Code, Description from ClassLevel where SchoolNo = '".$SchoolNoLocal."' order by Description"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$ClassLevelIDList = array();
$ClassLevelList = array();

array_push($ClassLevelIDList, "" );
array_push($ClassLevelList, "" );

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
      //echo '<option value="'.$row[0].'">'.$row[1].'</option>';
     array_push($ClassLevelIDList, $row[0] );
    array_push($ClassLevelList, $row[1] );
}     



$smarty->assign("classlevel_values", $ClassLevelIDList );
$smarty->assign("classlevel_output", $ClassLevelList );


if( $_COOKIE['class-classlevel-select'] != "" ) {
  $smarty->assign("classlevel_selected", $_COOKIE['class-classlevel-select']  );
}
  

sqlsrv_free_stmt( $stmt);

//**************************************************************


//Create The counts for the left Menu
/* Execute the query. */     
$tsql = "Select count(*) As recordcount from class where SchoolNo  = '".$SchoolNoLocal."'  And classyears = '".$_COOKIE['schoolyear']."' AND SEMESTER = '".$_COOKIE['schoolterm']."' ";     
  

$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
     
    $smarty->assign("NumberOfClasses", $row[0]);

}     



sqlsrv_free_stmt( $stmt);



//Create The counts for the left Menu
/* Execute the query. */     
$tsql = "select count(*)  As recordcount from Parent where schoolno =  '".$SchoolNoLocal."' and active = 1";     
  

$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
     
    $smarty->assign("NumberOfParents", $row[0]);

}     



sqlsrv_free_stmt( $stmt);



//Create The counts for the left Menu
/* Execute the query. */     
$tsql = "select count(*) As recordcount from Student where schoolno =  '".$SchoolNoLocal."'";     
  

$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
     
    $smarty->assign("NumberOfStudents", $row[0]);

}     



sqlsrv_free_stmt( $stmt);

//Create The counts for the left Menu
/* Execute the query. */     
$tsql = "select count(*) from lesson where schoolno =  '".$SchoolNoLocal."' 
and (select count(*) from class where lesson.classno = class.classno  and classyears = '".$_COOKIE['schoolyear']."' and semester = '".$_COOKIE['schoolterm']."') > 0 and active = 1";       
  


$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
     
    $smarty->assign("NumberOfClassLessons", $row[0]);

}     


sqlsrv_free_stmt( $stmt);

$tsql = "Select TeacherNo,Name,Phoneno,address1,address2,city,email from Staff where SchoolNo = '".$SchoolNoLocal."' order by Name";     
  

$stmt = sqlsrv_query( $conn, $tsql );


$data = "<table id='grid-selection' class='table table-condensed table-hover table-striped'>
    <thead>
        <tr>
            <th  data-column-id='TeacherNo' data-identifier='true'>TeacherNo #</th>
             <th data-column-id='Teacher'>Name</th>
             <th data-column-id='Phoneno' >Phoneno</th>
             <th data-column-id='Address1' >Address 1</th>
             <th data-column-id='Address2' >Address 2</th>
             <th data-column-id='City' >City</th>
             <th data-column-id='Email' >Email</th>
         
        </tr>
    </thead>
    <tbody>";



while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{	
  	
	$data  = $data . "<tr class='special' style='font-size:10px'><th style='width: 10%'><a href='javascript:OpenTeacherEdit(".$row[0].");' >".$row[0]."</a></th>";
	$data  = $data . "<th style='width: 35%'>".$row[1]."</th>";
	$data  = $data . "<th style='width: 10%'>".$row[2]."</th>";
	$data  = $data . "<th style='width: 15%'>".$row[3]."</th>";
	$data  = $data . "<th style='width: 10%'>".$row[4]."</th>";
	$data  = $data . "<th style='width: 10%'>".$row[5]."</th>";
    $data  = $data . "<th style='width: 10%'>".$row[6]."<th></tr>";	
	
	
	
	
}
/* Free statement and connection resources. */     
    
$data  = $data . "</tbody></table>";


sqlsrv_free_stmt( $stmt);	
	
	
$smarty->assign("myDatagridTable", $data );
	
	
sqlsrv_close( $conn); 



$smarty->display('smart_admin_staff.tpl');




?> 