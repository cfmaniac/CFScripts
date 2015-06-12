<!---\\ Creates a TimeInterval String: 48 Seconds Ago...Etc.
Easy Usage: #getTimeInterval(dateformat(now(), "MM/DD/YYYY")# - That is it
J Harvey
//--->
<cfscript>
    string function getTimeInterval( date, datemask="dddd dd mmmm yyyy" ){
        var timeinseconds = 0;
        var result = "";
        var interval = "";
        if( IsDate( arguments.date ) ){
        timeinseconds = DateDiff( 's', arguments.date, Now() );
// less than a minute
        if( timeinseconds < 60 ){
        result = " less than a minute ago";
}
// less than an hour
else if ( timeinseconds < 3600 ){
        interval = Int( timeinseconds / 60 );
// more than 1 minute
        if ( interval > 1 ) result = interval & " minutes ago";
else result = interval & " minute ago";
}
// less than 24 hours
else if ( timeinseconds < ( 86400 ) && Hour( Now() ) >= Hour( arguments.date ) ){
        interval = Int( timeinseconds / 3600 );
// more than 1 hour
        if ( interval > 1 ) result = interval & " hours ago";
else result = interval & " hour ago";
}
// less than 48 hours
else if ( timeinseconds < 172800 ){
        result = "yesterday" & " at " & TimeFormat( arguments.date, "HH:MM" );
}
// return the date
else{
        result = DateFormat( arguments.date, arguments.datemask ) & " at " & TimeFormat( arguments.date, "HH:MM" );
}
}
    return result;
}
</cfscript>