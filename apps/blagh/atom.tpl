<?xml version="1.0" encoding="utf-8"?>

%{
# See for more info:http://www.tbray.org/ongoing/When/200x/2005/07/27/Atomic-RSS
fn statpost {
    f = $1

    post_uri=$base_url^`{cleanname `{echo $f | sed -e 's!^'$sitedir'!!'}}^'/'
    title=`{read $f/index.md}
    by=`{ls -m $f | sed 's/^\[//g; s/].*$//g' >[2]/dev/null}
    #ifs=() { summary=`{cat $f/index.md | strip_title_from_md_file | ifs=$difs {$formatter} } }
    summary=`{cat $f/index.md | strip_title_from_md_file | $formatter | escape_html }
}
# rfc3339 date when feed was last updated.
fupdated = `{ndate -a `{date `{mtime `{ls $blagh_root$blagh_dirs/[0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9]/[0-9] | tail -1} | awk '{print $1}'}}}
%}

<feed xmlns="http://www.w3.org/2005/Atom"
    xmlns:thr="http://purl.org/syndication/thread/1.0">

% if(! ~ $"conf_blog_pubsubdub_hub '') {
%    echo '<link rel="hub" href="'$conf_blog_pubsubdub_hub'" />'
% }

    <link rel="self" href="%($base_url^$req_path%)"/>
    <id>%($base_url^$req_path%)</id>
    <icon><![CDATA[/favicon.ico]]></icon>

    <title><![CDATA[%($siteTitle%)]]></title>
    <subtitle><![CDATA[%($siteSubTitle%)]]></subtitle>

    <updated>%($fupdated%)</updated>
    <link href="."/>

% for(f in `{get_post_list $blagh_root$blagh_dirs}) {
%    statpost $f

    <entry>
% # Maybe we should be smarter, see: http://diveintomark.org/archives/2004/05/28/howto-atom-id, example: <id>tag:intertwingly.net,2004:2899</id>
        <id>%($post_uri%)</id>
        <link href="%($post_uri%)"/>
        <title><![CDATA[%($title%)]]></title>
% # <link rel="replies" href="2899.atom" thr:count="0"/>
        <author><name><![CDATA[%($by%)]]></name></author>

        <content type="html">
            %($summary%)
        </content>

% # rfc3339 date when entry was last updated.
% eupdated=`{ndate -a `{date `{mtime $f | awk '{print $1}'}}}
        <updated>%($eupdated%)</updated>
    </entry>

% }

</feed>

% exit 
