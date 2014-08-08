/**
 * @author      Josep Vall-llobera <valnavjo_at_gmail.com>
 * @version     1.1.0
 * @since       03/02/2013
 */
public class SfdcZipSampleController {

	public String zipFileName {get; set;}
	public String zipContent {get; set;}

	public PageReference uploadZip() {
		if (String.isEmpty(zipFileName) ||
			String.isBlank(zipFileName)) {
			zipFileName = 'my_zip.zip';
		}
		else {
			zipFileName.replace('.', '');
			zipFileName += '.zip';
		}
		
		Document doc = new Document();
		doc.Name = zipFileName;
		doc.ContentType = 'application/zip';
		doc.FolderId = UserInfo.getUserId();
		doc.Body = EncodingUtil.base64Decode(zipContent);
		
		insert doc;
		
		this.zipFileName = null;
		this.zipContent = null;

		PageReference pageRef = new PageReference('/' + doc.Id);
		pageRef.setRedirect(true);
		
		return pageRef;
	}

	public List<Attachment> getAttachments() {
		return [select Id, ParentId, Name, ContentType, BodyLength
				from Attachment
				limit 100];
	}
	
	@RemoteAction
	public static AttachmentWrapper getAttachment(String attId) {
		
		Attachment att = [select Id, Name, ContentType, Body
						  from Attachment
						  where Id = :attId];
		
		AttachmentWrapper attWrapper = new AttachmentWrapper();
		attWrapper.attEncodedBody = EncodingUtil.base64Encode(att.body);
		attWrapper.attName = att.Name;
						  
		return attWrapper;
	}
	
	public class AttachmentWrapper {
		public String attEncodedBody {get; set;}
		public String attName {get; set;}
	}
}