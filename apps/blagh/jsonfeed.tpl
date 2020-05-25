{
"version":       "https://jsonfeed.org/version/1",
"title":         "%($siteTitle%)",
"home_page_url": "%($"base_url%)",
"feed_url":      "%($"base_url^$"req_path%)",
"items": [
%{
fn statpost {
    f = $1
    post_uri=$base_url^`{cleanname `{echo $f | sed -e 's!^'$sitedir'!!'}}^'/'
    title=`{read $f/index.md}
    #ifs=() { summary=`{cat $f/index.md | crop_text 1024 ... | $formatter } }
    ifs=() { summary=`{cat $f/index.md | strip_title_from_md_file | ifs=$difs {$formatter| sed 's/"/\\"/g' | tr -d '\012' } } }
}
%}
% #for(f in `{get_post_list $blagh_root$blagh_dirs}) {
%
% postlist=`{get_post_list $blagh_root$blagh_dirs}
% postcount=0
% for(f in $postlist) {
%    statpost $f
        {
  "id": "%($post_uri%)",
  "url": "%($post_uri%)",
  "title": "%($title%)",
  "content_html": "%($summary%)"
  }
% postcount = `{echo $postcount  1+p | dc}
% if (! ~ $#postlist $postcount) { echo , }  
% }
]
}

% exit 

