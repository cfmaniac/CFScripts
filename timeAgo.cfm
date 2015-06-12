<!---\\ Creates a TimeAgo String: 1 Year 6 Months
Easy Usage: #TimeAgo(dateformat(now(), "MM/DD/YYYY")# - That is it
J Harvey
//--->

<cfscript>
function TimeAgo(TimeFormat)
{
    currentDate = dateformat(now(), 'MM/DD/YYYY');
    referenceDate = dateformat(MemberJoined, 'MM/DD/YYYY');
    years2go = Abs(DateDiff("yyyy", currentDate, MemberJoined));
    months2go = Abs(DateDiff("m", currentDate, MemberJoined));
    months2go = months2go-(years2go*12);
    weeks2go = Abs(DateDiff("ww", currentDate, MemberJoined));
    days2go = Abs(DateDiff("d", currentDate, MemberJoined));
    MemberAge = years2go & ' Years ' & months2go &' Months';
    return MemberAge;
}
</cfscript>