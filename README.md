salesforce-file-compression
===========================
Imagine that you want to zip a bunch of Files (Attachments, Documents, etc.) and send them via email. Right now there isn't any app in the Appexchange that provides this functionality and, actually, there isn't any class in Salesforce that allows developers to compress files. So, what's the workaround? I will give you a clue... forget about compress server-side ;)

Right now the only way is performing the compression <strong>client-side</strong>. The way in which this works is by using the Javascript library called JSZip.

Tested in the following web browsers:
<ul>
	<li>Chrome v24.</li>
	<li>Firefox v18.</li>
	<li>Safari v6.</li>
</ul>

See the full reference <a href="http://www.valnavjo.com/blog/?p=315" target="_blank">here</a>.

Be Apex my friend!
