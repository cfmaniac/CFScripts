<cfscript>
/**
 * Produces output used by the vCalendar standard 
 * 
 * @param stEvent 	 Structure containg the key/value pairs comprising the vCalendar data.  Keys are shown below: 
 * @param stEvent.subject 	 Subject of the event. 
 * @param stEvent.startTime 	 Event's start time in GMT. 
 * @param stEvent.endTime 	 Event's end time in GMT. 
 * @return Returns a string. 
 * @author Chris Wigginton (cwigginton@macromedia.com) 
 * @version 1.1, April 10, 2002 
 * @author bek (bek@viawest.net)
 * @version 1.2, 12 August 2002
 * @features - now include 5 minute alarm and a very compact size
 *
 */
function vCal(stEvent)
{

	var vCal = "";
	var dAlarm = "";
	var CRLF=chr(13)&chr(10);
	
	if (NOT IsDefined("stEvent.startTime"))
		stEvent.startTime = DateConvert('local2Utc', Now());
	
	if (NOT IsDefined("stEvent.endTime"))
		stEvent.endTime = DateConvert('local2Utc', Now());
		
	if (NOT IsDefined("stEvent.subject"))
		stEvent.subject = "Auto vCalendar Generated";

	dAlarm = DateAdd("n",-5,stEvent.startTime);			
	
	vCal = "BEGIN:VCALENDAR" & CRLF;
	vCal = vCal & "VERSION:1.0" & CRLF;
	vCal = vCal & "PRODID:VIAWEST GENERATED" & CRLF;
	vCal = vCal & "BEGIN:VEVENT" & CRLF;
	vCal = vCal & "SUMMARY;ENCODING=QUOTED-PRINTABLE:" & stEvent.subject & CRLF;
	vCal = vCal & "DTSTART:" & 
			DateFormat(stEvent.startTime,"yyyymmdd") & "T" & 
			TimeFormat(stEvent.startTime, "HHmmss") & "Z" & CRLF;
	vCal = vCal & "DTEND:" & DateFormat(stEvent.endTime, "yyyymmdd") & "T" & 
			TimeFormat(stEvent.endTime, "HHmmss") & "Z" & CRLF;
	vCal = vCal & "DALARM:" & DateFormat(dAlarm, "yyyymmdd") & "T" &
			TimeFormat(dAlarm, "HHmmss") & "Z" & CRLF;
	vCal = vCal & "END:VEVENT" & CRLF;
	vCal = vCal & "END:VCALENDAR" & CRLF;	
	
	return vCal;
	
}
</cfscript>
