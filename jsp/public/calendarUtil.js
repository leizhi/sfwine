function calendar(elementId)
{
      var returnValue = window.showModalDialog('../common/calendar.htm',"","dialogHeight:250px;dialogWidth:190px;status:no;scroll:no");
	  var date = document.getElementById(elementId);
	  if(returnValue != "")
		  date.value = returnValue;	 
}
function calendarMonth(elementId)
{
      var returnValue = window.showModalDialog('../common/calendar.htm',"","dialogHeight:250px;dialogWidth:190px;status:no;scroll:no");
	  var date = document.getElementById(elementId);
	  if(returnValue != "")
        {
            var dateArray = returnValue.split("-");
            date.value = dateArray[0]+"-"+dateArray[1];
         }
}
function setDefaultDate()
{
	  var date = document.getElementById('date');
	  var currentDate = new Date();
	  var month = currentDate.getMonth()+1;
	  var dateNow = currentDate.getDate();
	  if(month < 10)
		  month = '0'+month;
	  if(dateNow <10)
		  dateNow = '0'+dateNow;
	  date.value = currentDate.getYear()+'-'+month+'-'+dateNow;
}
function calendar1(elementId)
{
      var returnValue = window.showModalDialog('../common/calendar.htm',"","dialogHeight:250px;dialogWidth:190px;status:no;scroll:no");
	  var date1 = document.getElementById(elementId);
	  if(returnValue != "")
		  date1.value = returnValue;	 
}
function calendar2(elementId)
{
      var returnValue = window.showModalDialog('../common/calendar.htm',"","dialogHeight:250px;dialogWidth:190px;status:no;scroll:no");
	  var date2 = document.getElementById(elementId);
	  if(returnValue != "")
		  date2.value = returnValue;	 
}
function calendar3(elementId)
{
      var returnValue = window.showModalDialog('../common/calendar.htm',"","dialogHeight:250px;dialogWidth:190px;status:no;scroll:no");
	  var date3 = document.getElementById(elementId);
	  if(returnValue != "")
		  date3.value = returnValue;	 
}
function isDate(oDateTime)
{
    //�����ڸ�ʽ������֤ Ҫ��Ϊ2000-2099��  ��ʽΪ yyyy-mm-dd[ hh:mi:ss]  ���ҿ�������ת������ȷ������
    var pat_hd=/^(20\d{2}-((0[1-9]{1})|(1[0-2]{1}))-((0[1-9]{1})|([1-2]{1}[0-9]{1})|(3[0-1]{1}))){1}(\s\d{2}:\d{2}:\d{2})?$/;
 try{
   if(!pat_hd.test(oDateTime)) throw "���ڷǷ���";
   var arr_dt=oDateTime.split(" ");
   if(arr_dt[0]=='') throw "���ڷǷ���";
   var oDate=arr_dt[0];
   var arr_hd=oDate.split("-");
   var dateTmp;
   dateTmp= new Date(arr_hd[0],parseFloat(arr_hd[1])-1,parseFloat(arr_hd[2]));
   if(dateTmp.getFullYear()!=parseFloat(arr_hd[0]) || dateTmp.getMonth()!=parseFloat(arr_hd[1]) -1 || dateTmp.getDate()!=parseFloat(arr_hd[2])) throw "���ڷǷ���";
            if(arr_dt[1] && arr_dt[1]!='')
            {
               var oTime=arr_dt[1];
               var arr_ht=oTime.split(":");
               dateTmp.setHours(arr_ht[0],arr_ht[1],arr_ht[2]);
      if(dateTmp.getHours()!=parseFloat(arr_ht[0]) || dateTmp.getMinutes()!=parseFloat(arr_ht[1]) || dateTmp.getSeconds()!=parseFloat(arr_ht[2])) throw "���ڷǷ���";
            }
  }
 catch(ex)
  {
   if(ex.description)
   {return false;}
   else
    {return false;}
  }
 return true;
}
function getNowDate()
{
  var currentDate = new Date();
	  var month = currentDate.getMonth()+1;
	  var dateNow = currentDate.getDate();
	  if(month < 10)
		  month = '0'+month;
	  if(dateNow <10)
		  dateNow = '0'+dateNow;
	 return currentDate.getYear()+'-'+month+'-'+dateNow;

}
function tick()   
{   
var hours,minutes,seconds,ap;   
var intHours,intMinutes,intSeconds;   
var today;   
today=new Date();    
intHours=today.getHours();   
intMinutes=today.getMinutes();   
intSeconds=today.getSeconds();   
//��ȡϵͳʱ���Сʱ��   
if(intHours==0)   
{   
hours=intHours+":";   
ap="�賿";   
}   
else if(intHours<12)   
{   
hours=intHours+":";   
ap="�糿";   
}   
else if(intHours==12)   
{   
hours=intHours+":";   
ap="����";   
}   
else  
{   
intHours=intHours-12;   
hours=intHours+":";   
ap="����";   
}   
//��ȡϵͳʱ��ķ���   
if(intMinutes<10)   
{   
minutes="0"+intMinutes+":";   
}   
else  
{   
minutes=intMinutes+":";   
}   
//��ȡϵͳʱ�������   
if(intSeconds<10)   
{   
seconds="0"+intSeconds+" ";   
}   
else  
{   
seconds=intSeconds+" ";   
}   
timeString=ap+hours+minutes+seconds;   
document.getElementById("Clock").innerHTML=timeString;   
//ÿ��0.1����ִ��һ��tick����   
window.setTimeout("tick()",100);   
}  
function ChangeDate(obj)
{
	//��YYYYMMDD������ת��Ϊyyyy-mm-dd������
	if(obj.value.length==8)
	{
		var temp=obj.value.substr(0,4)+"-"+obj.value.substr(4,2)+"-"+obj.value.substr(6,2);
		obj.value=temp;
		if(CheckData(obj,"���ڷǷ���"))
			obj.value=temp;
	}else
	{
		if(obj.value.length==10)
		{
			if(CheckData(obj,"���ڷǷ���"))
			   obj.value=obj.value;
		}else  if (obj.value==""||obj.value.indexOf(" ") != -1||obj.value.indexOf("��")!=-1)
        {
		  obj.value="";
          return;
        }else
		{
			alert("��������ڸ�ʽ���󣡣�YYYYMMDD��yyyy-mm-dd��");
			obj.value="";
		}
	}
}