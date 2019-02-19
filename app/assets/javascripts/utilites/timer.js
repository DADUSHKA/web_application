document.addEventListener("turbolinks:load", function(){
  var year = document.getElementById('year').innerHTML;
  var month = document.getElementById('month').innerHTML;
  var day = document.getElementById('day').innerHTML;
  var hour = document.getElementById('hour').innerHTML;
  var minute = document.getElementById('minute').innerHTML;
  var second = document.getElementById('second').innerHTML;
  var timeTest = document.getElementById('time_test').innerHTML;

  timeend= new Date();
  timeend= new Date(year,month,day,hour,minute,second);
  timeperiod = timeTest * 1000;
  console.log(timeperiod)
  if (timeTest > 1) {
    time();
  }

})

function time() {
  text = "Таймер прохожденя теста"
  today = new Date();
  today = Math.floor((timeperiod+(timeend-today))/1000);
  tsec=today%60; today=Math.floor(today/60); if(tsec<10)tsec='0'+tsec;
  tmin=today%60; today=Math.floor(today/60); if(tmin<10)tmin='0'+tmin;
  thour=today%24; today=Math.floor(today/24);
  timestr=text+" : "+thour+" ч "+tmin+" мин "+tsec+" сек";
  document.querySelector('#t').innerHTML=timestr;
  inter=window.setTimeout("time()",1000);

  var id = document.getElementById('id').innerHTML;
  var str = "/test_passages/"+id+"/result"
  console.log(str)
  if(tmin=='00' && tsec=='00'){
    tsec="00";
    clearInterval(inter);
    alert('Вы не успели пройти тест!');
     window.location.pathname = str;
  }
}



