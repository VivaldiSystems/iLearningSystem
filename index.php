<?php
/**
 * Example Application
 *
 * @package Example-application
 */

require 'libs/Smarty.class.php';


header('Content-Type:text/html;charset=utf-8');
//$_COOKIE['district'] = "INNOVAKIDS";



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



$strusername = $_GET['username'];
$strpassword = $_GET['zipzot'];

//echo '<script type="text/javascript">alert("Param User: '.$_GET['username'].'");</script>';



if( $strusername == ""){

   
    $strusername = $_COOKIE['loginemail']; 
    $strpassword = $_COOKIE['password'];
    
   // echo '<script type="text/javascript">alert("Cookie: '. $strpassword  . '");</script>';

    
} else {
    
   

    $encoded = $strpassword;   // <-- encoded string from the request
    $decoded = "";
    for( $i = 0; $i < strlen($encoded); $i++ ) {
        $b = ord($encoded[$i]);
        $a = $b ^ 123;  // <-- must be same number used to encode the character
        $decoded .= chr($a);
    }

     $strpassword =  $decoded;  
    
    // echo '<script type="text/javascript">alert("' . $strusername  . '");</script>';

}



//check user
//$_COOKIE['username']

/* Execute the query. */     
$tsql = "Select Top 1  t.TeacherNo, t.SchoolNo, s.School, t.Name , s.AdminEmail, t.SecurityCodes, s.District  from dbo.LoginView t inner join school s on s.SchoolNo = t.SchoolNo  where t.Email = '".$strusername."'  And t.Password = '".$strpassword."'"; 


//echo '<script type="text/javascript">alert("' . $tsql . '");</script>';

$params = array();
$options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
$stmt = sqlsrv_query( $conn, $tsql , $params, $options );

        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, 10); 

$SchoolList = array();
$SchoolNoList = array();
$DistrictLocal = "";
$SchoolNoLocal = "";

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC))     
{     
   
    setcookie("loginemail",$strusername);   
    setcookie("password",$strpassword);   
    //$_COOKIE['password'] = $strpassword;
   // echo '<script type="text/javascript">alert("Setting: ' . $_COOKIE['password'] . '");</script>';
    
    
    setcookie('district', $row['District']);
    setcookie('districtname', $row['District']);
    setcookie('schoolno', $row['SchoolNo']);
    setcookie('schoolname', $row['School']);
    setcookie('name', $row['Name']);
    setcookie('teacherno', $row['TeacherNo']);
    setcookie('adminemail', $row['Adminemail']);
    setcookie('securitycodes', $row['SecurityCodes']);
    
    $TeacherNoLocal = $row['TeacherNo'];
    
    $SchoolNoLocal =  $row['SchoolNo'];

    $smarty->assign("DistrictName", $row['districtname'] );  
 
    
   
}     
    

 //echo '<script type="text/javascript">alert("Setting: ' . $SchoolNoLocal . '");</script>';
  


if( $SchoolNoLocal == "" ){
  
     
  header("Location: smart_admin_login.php");
  
}



sqlsrv_free_stmt( $stmt);

require 'req_scripts.php';
  
  
/* Execute the query. */     
$tsql = "Select SchoolNo,School+' ('+convert(varchar,SchoolNo)+')' As SchoolName from School where district = '".$DistrictLocal."' order by District,School"; 

$params = array();
$options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
$stmt = sqlsrv_query( $conn, $tsql , $params, $options );

        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, 10); 

$SchoolList = array();
$SchoolNoList = array();


while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC))     
{     
   
    $SchoolNoList[] = $row['SchoolNo'];
    $SchoolList[] = $row['SchoolName'];
}     
    

$smarty->assign("NumberOfSchools", count($SchoolList) );

$smarty->assign("school_values", $SchoolNoList );
$smarty->assign("school_output", $SchoolList );


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

//Teacher Activity Feeds

/* Execute the query. */     
$tsql = "Select Top 5 ID,Subject,cast(Eventdate as varchar) as Eventdate,Title,Link from TEACHERACTIVITY Where TeacherNo = '".$TeacherNoLocal."' AND SCHOOLNO = '".$SchoolNoLocal."' Order by eventdate desc"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$SchoolEventFeeds = "";


while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
       
    $SchoolEventFeeds = $SchoolEventFeeds."<li><i class=\"icon-li fa fa-location-arrow\"></i><u>".$row[1]."</u> - ".$row[2]." ".$row[3]."</li>";
    
}     


$smarty->assign("TeacherActivityFeeds", $SchoolEventFeeds );



sqlsrv_free_stmt($stmt);







//School News


/* Execute the query. */     
$tsql = "Select Top 3 ID,Subject,cast(Eventdate as varchar) as Eventdate,Title,Link from SchoolNews where schoolno = '".$SchoolNoLocal."' Order by eventdate desc"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$SchoolEventFeeds = "";


while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
       
    $SchoolEventFeeds = $SchoolEventFeeds."<li><button type=\"button\" class=\"btn btn-default demo-element ui-popover\" data-toggle=\"tooltip\" data-placement=\"top\" data-trigger=\"hover\" data-content=\"". $row[1].": ".$row[2]." ".$row[3]."\" title=\"".$row[1]."\">View</button>".$row[3]."</li>";
    
}     


$smarty->assign("SchoolEventFeeds", $SchoolEventFeeds );



sqlsrv_free_stmt($stmt);


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
and (select count(*) from class where lesson.classno = class.classno and 
classyears = '".$_COOKIE['schoolyear']."' and semester = '".$_COOKIE['schoolterm']."') > 0 and active = 1";       
  

$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
     
    $smarty->assign("NumberOfActiveLessons", $row[0]);

}     


sqlsrv_free_stmt( $stmt);



$tsql = "Select Top 3 ID,Subject,cast(Eventdate as varchar) as Eventdate,Title,Link from EducationNews Order by eventdate desc"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$SchoolEventFeeds = "";


while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
       
 
      $SchoolEventFeeds = $SchoolEventFeeds . "<li>  <a href='".$row[4]."' target='_blank'><span class='label label-info demo-element'>Read More</span></a>".$row[1]." - ".$row[2]." ".$row[3]."  </li>";

    
}     

$smarty->assign("TeacherNo", $TeacherNoLocal);
$smarty->assign("NewsFeeds", $SchoolEventFeeds);

sqlsrv_free_stmt($stmt);


$strclass = str_replace("#","",$strclass);                
$strclass = str_replace(" ","+",$strclass); 


$newsfeed =  "";
$intCount = 0;





$tsql = "Select Top 5 ID,Subject,cast(Eventdate as varchar) as Eventdate,Title,Link from ClassNews Where TeacherNo = '".$TeacherNoLocal."' AND SCHOOLNO = '".$SchoolNoLocal."' Order by eventdate desc"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$SchoolEventFeeds = "";


while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
  
      $SchoolEventFeeds = $SchoolEventFeeds."<li><span class=\"badge badge-secondary demo-element\">".$row[2]."</span>".$row[1]." - ".$row[2]." ".$row[3]."</li>";
    
}     


$smarty->assign("ClassFeeds", $SchoolEventFeeds);

sqlsrv_free_stmt($stmt);



$tsql = "Select Top 3 ID,Subject,cast(Eventdate as varchar) as Eventdate,Title,Link from SubjectNews Order by eventdate desc"; 
$stmt = sqlsrv_query( $conn, $tsql);     
        
/* Iterate through the result set printing a row of data upon each iteration.*/     
//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC); 

$SchoolEventFeeds = "";


while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))     
{     
       
 
      $SchoolEventFeeds = $SchoolEventFeeds . "<li>  <a href='".$row[4]."'  target='_blank'><span class='label label-info demo-element'>Read More</span></a>".$row[1]." - ".$row[2]." ".$row[3]."  </li>";

    
}     


$smarty->assign("SubjectFeeds", $SchoolEventFeeds);

sqlsrv_free_stmt($stmt);




/* Free statement and connection resources. */     
    
sqlsrv_close( $conn); 


$smarty->display('index.tpl');

?> 