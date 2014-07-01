package util;

import java.util.UUID;

public class UploadUtil {
	
	public static boolean checkImgType(String filename){
		String ext=filename.substring(filename.indexOf(".")+1);
		String type="bmp,jpg,tiff,gif,pcx,png,tga,exif,fpx,svg,psd,cdr,pcd,dxf,ufo,eps,ai,raw";
		for(String temp:type.split(",")){
			if(temp.equalsIgnoreCase(ext))
				return true;
		}
		return false;
	}
	
	public static String generateUUIDName(String filename){
		String ext=filename.substring(filename.indexOf(".")+1);
		return UUID.randomUUID().toString()+"."+ext;
	}

}
