package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class Androidquirks {
	
	
	public static function sampleMethod (inputValue:Int):Int {
		
		#if (android && openfl)
		
		var resultJNI = androidquirks_sample_method_jni(inputValue);
		var resultNative = androidquirks_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;
		
		#else
		
		return androidquirks_sample_method(inputValue);
		
		#end
		
	}
	
	
	private static var androidquirks_sample_method = Lib.load ("androidquirks", "androidquirks_sample_method", 1);
	
	#if (android && openfl)
	private static var androidquirks_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.Androidquirks", "sampleMethod", "(I)I");
	#end
	
	
}