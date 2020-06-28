<%@ page
	import="java.io.InputStream, 
			java.net.URL, 
			java.net.URLConnection,
			java.net.URLDecoder,
			java.net.URLEncoder,
			java.security.MessageDigest,
			javax.crypto.Cipher,
			javax.crypto.KeyGenerator,
			javax.crypto.SecretKey,
			javax.crypto.spec.IvParameterSpec,
			javax.crypto.spec.SecretKeySpec,
			javax.xml.namespace.QName,
			javax.xml.rpc.ParameterMode,
			org.apache.axis.client.Call,
			org.apache.axis.client.Service,
			org.apache.axis.encoding.XMLType,
			sun.misc.BASE64Decoder,
			sun.misc.BASE64Encoder"
%>

<%!

///	#############################################################################
///	#####
///	#####	�ѱ��ſ������ֽ�ȸ��			���� �Ǹ�Ȯ�� ���� ó�� ��ũ��Ʈ
///	#####
///	#####	=====================================================================
///	#####
///	#####	Descriptions
///	#####		- �ѽ������� �����ϴ� Web Service�� ȣ���Ѵ�.
///	#####
///	#####	---------------------------------------------------------------------
///	#####
///	#####	�ۼ��� 		: (��)�ѱ��ſ����� (www.nice.co.kr)
///	#####	��������	:
///	#####	��������	:
///	#####	�ۼ�����	: 2006.02.01
///	#####
///	#############################################################################

public class OivsObjects 
{
	public final static String 	DELIMETER_NORMAL	= "!#!";
	public final static String 	DELIMETER_DATA		= "!@!";
	public final static String 	SVC_TYPE_PERSONAL	= "0";
	public final static String 	SVC_TYPE_CORPERATE	= "1";
	public final static String 	SVC_TYPE_FOREIGNER	= "2";
	public final static int		CRND_SIZE			= 24;
	public final static int		SRND_SIZE			= 112;
	public final static String	CHARSET_DEFAULT		= "8859_1";
	public final static String	CHARSET_SERVER		= "utf-8";
	
	public final static String	URL_PING					= "http://secure.nuguya.com/nuguya/rlnmPing.do";
	public final static String 	URL_QNAME					= "http://service.oivs.nuguya.nice";
	public final static String 	URL_SECURESERVICE			= "http://secure.nuguya.com/nuguya/webservice/SecureService";
	public final static String 	URL_REALNAMESERVICE			= "http://secure.nuguya.com/nuguya/webservice/RealNameService";

	private Call callSecure 	= null;
	private Call callRealName	= null;
	
	private String hexPseudo[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
	
	//	������ �ʵ�
	public String clientData	= "";
	public String niceId		= "";
	public String pingInfo		= "";
	public String userNm		= "";
	public String resIdNo		= "";
	public String inqRsn		= "";
	public String foreigner	= "";
	public String minor		= "";
	public String message		= "";
	public String retCd		= "";
	public String retDtlCd		= "";
	public String ckData		= "";
	public String skData		= "";
	public String identifier	= "";
	public String dupeinfo	= ""; 

	/**
	 * �⺻ �����ڷ� �ʵ� �ʱ�ȭȭ�� ���� ������ ó���Ѵ�.
	 */
	public OivsObjects()
	{
		initialize();
	}

	/*
	 * �ʵ带 �ʱ�ȭ ó���Ѵ�.
	 */
	private void initialize()
	{
		this.pingInfo = webGetter( URL_PING );
		makeServiceCaller();
	}

	/*
	 * ���� ȣ�⿡ �ʿ��� Caller�� �����Ͽ� �����Ѵ�.
	 */
	private void makeServiceCaller()
	{
		try
		{
			Service svc = new Service();
	        try{
				this.callSecure = (Call) svc.createCall();
				this.callRealName = (Call) svc.createCall();
				
				callSecure.setTargetEndpointAddress( new URL( URL_SECURESERVICE ) );
				callRealName.setTargetEndpointAddress( new URL( URL_REALNAMESERVICE ) );
			}catch( Exception ex )
			{
			}
		}
		catch( Exception ex )
		{
			this.message = "�ѱ��ſ������� ���񽺿� ������ �� �����ϴ�. [nice.nuguya.oivs.inc - makeServiceCaller]";
			ex.printStackTrace();
		}
	}

	/*
	 * ������ URL�� ȣ���Ͽ� ��ȯ ������ ��ȯ�Ѵ�.
	 */
	private String webGetter( String targetUrl )
	{
		URLConnection	conn = null;
		
		try
		{
			URL	url = new URL( targetUrl );
			conn = url.openConnection();
		}
		catch( Exception ex ) { return ""; }

		StringBuffer sbHtml = new StringBuffer();
		InputStream in = null;

		try
		{
			in = conn.getInputStream();
			int offset = 0;

			while( offset > -1 )
			{
				byte[] b = new byte[1024];
				offset = in.read( b );
				if ( offset > 0 ) sbHtml.append( new String( b, 0, offset ) );
			}
		}
		catch( Exception ex ) 
		{
			this.message = "�ѱ��ſ������� ���񽺿� ������ �� �����ϴ�. [nice.nuguya.oivs.inc - makeServiceCaller]";
			return ""; 
		}
		finally 
		{ 
			try
			{ 
				if ( in != null ) in.close(); 
			} 
			catch( Exception ex ) {} 
		}
		
		if ( sbHtml.indexOf( "500" ) >= 0 )
			return "";
		else
			return sbHtml.toString().trim();
	}
	
	/*
	 * ���޵� ���ڿ��� Decode�Ͽ� ��ȯ�Ѵ�.
	 */
	private byte[] decode( String encodeString )
	{
		BASE64Decoder B64Decoder = new BASE64Decoder();
		byte[] bytDecodedData;
		
		try
		{
			bytDecodedData = B64Decoder.decodeBuffer( encodeString );
			return bytDecodedData;
		}
		catch( Exception ex )
		{
			this.message = "���񽺿��� ����� ���ڿ��� ��ȯ(Decode)�� �� �����ϴ�. [nice.nuguya.oivs.inc - decode]";
			return null;
		}
	}
	
	/*
	 * ���޵� byte[]�� Encode�� ���ڿ��� ��ȯ�Ѵ�.
	 */
	public String encode( byte[] plainData )
	{
		BASE64Encoder B64Encoder = new BASE64Encoder();
		String strEncodedString;
		
		try
		{
			strEncodedString = B64Encoder.encode( plainData );
			return strEncodedString;
		}
		catch( Exception ex )
		{
			this.message = "���񽺿��� ����� ���ڿ��� ��ȯ(Encode)�� �� �����ϴ�. [nice.nuguya.oivs.inc - encode]";
			return "";
		}
	}

	/*
	 * Triple-DES Decryption Method
	 */
	private String TriDES_DecryptString( byte[] key, byte[] encMessage )
	{
		byte[] bytDecryptedData;
		SecretKey sKey;
		Cipher DecryptCipher;

		try
		{
			//	Ű�� �����Ѵ�.
			sKey = new SecretKeySpec( key, "DESede" );

			//	Cipher�� �����ϰ� �ʱ�ȭ �Ѵ�.
			DecryptCipher = Cipher.getInstance( "DESede/CBC/NoPadding" );
			DecryptCipher.init( Cipher.DECRYPT_MODE, sKey, new IvParameterSpec( key, 0, 8 ) );
			
			bytDecryptedData = DecryptCipher.doFinal( encMessage );
			return new String( bytDecryptedData, CHARSET_SERVER );
		}
		catch( Exception ex )
		{
			this.message = "���񽺿��� ����� ���ڿ��� ��ȣȭó�� �� �� �����ϴ�. [nice.nuguya.oivs.inc - TriDES_DecryptString]";
			return "";
		}
	}

	/*
	 * Triple-DES Encryption Method
	 */
	public byte[] TriDES_EncryptString( byte[] key, String plainMessage )
	{
		byte[] bytEncryptedData;
		SecretKey sKey;
		Cipher EncryptCipher;
		
		try
		{
			//	Ű�� �����Ѵ�.
			sKey = new SecretKeySpec( key, "DESede" );

			//	Cipher�� �����ϰ� �ʱ�ȭ �Ѵ�.
			EncryptCipher = Cipher.getInstance( "DESede/CBC/NoPadding" );
			EncryptCipher.init( Cipher.ENCRYPT_MODE, sKey, new IvParameterSpec( key, 0, 8 ) );

			bytEncryptedData = convert8bytes( plainMessage.getBytes() );

			bytEncryptedData = EncryptCipher.doFinal( bytEncryptedData );
			return bytEncryptedData;
		}
		catch( Exception ex )
		{
			this.message = "���񽺿��� ����� ���ڿ��� ��ȣȭó�� �� �� �����ϴ�. [nice.nuguya.oivs.inc - TriDES_EncryptString]\\n[��������]\\n" + ex.getMessage();
			return null;
		}
	}
	
	public SecretKey generateRandomKey( int keySize )
	{
		SecretKey sKey;
		
		try
		{
			KeyGenerator kg = KeyGenerator.getInstance( "DESede" );
			kg.init( keySize );
			sKey = kg.generateKey();

			return sKey;
		}
		catch( Exception ex )
		{
			this.message = "���� ������ ���� ����Ű�� ������ �� �����ϴ�. [nice.nuguya.oivs.inc : callService(generateRandomKey)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
			return null;
		}
	}

	/*
	 * Byte Array�� Hex String���� ��ȯ�Ѵ�.
	 */
	public String convertByteArrayToHexString( byte[] sourceBytes )
	{
		byte ch = 0x00;
		int nIndex = 0;
		
		if ( sourceBytes == null || sourceBytes.length <= 0 ) return "";
		
		StringBuffer sbOut = new StringBuffer( sourceBytes.length * 2 );
		
		while ( nIndex < sourceBytes.length )
		{
			ch = (byte) (sourceBytes[nIndex] & 0xF0);			//	Strip Off high nibble
			ch = (byte) (ch >>> 4);								//	Strip the bits down
			ch = (byte) (ch & 0x0F);							//	high order bit is on
			sbOut.append( hexPseudo[ (int) ch ] );				//	Convert the nibble to a String Character
			ch = (byte) (sourceBytes[nIndex] & 0x0F);			//	Strip Off low nibble
			sbOut.append( hexPseudo[ (int) ch ] );				//	Convert the nibble to a String Character
			nIndex++;
		}
		
		return sbOut.toString();
	}
	
	/*
	 * 
	 */
	public String getHashedString( String plainString )
	{
		MessageDigest md;
		byte[] bytData, bytHashedData;

		try
		{
			bytData = plainString.getBytes();
			md = MessageDigest.getInstance( "MD5" );
			md.update( bytData );
			
			bytHashedData = md.digest();

			return this.convertByteArrayToHexString( bytHashedData );
		}
		catch( Exception ex )
		{
			this.message = "���� ������ ���� �ؽ������� ������ �� �����ϴ�. [nice.nuguya.oivs.inc : callService(getHashedString)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
			return null;
		}
	}

	/*
	 * ���񽺿��� ���޵� ������ �и��ϰ� ��ȣȭ�Ѵ�.
	 */
	private String[] resolveReturnValue( String returnValue )
	{
		String[] aryValues = new String[] {};
		
		aryValues = returnValue.split(DELIMETER_NORMAL);

		if ( aryValues.length < 5 )
		{
			this.message = "�Ǹ�Ȯ�� ���񽺿��� ��ȯ�� ����� ó���� �� �����ϴ�. [nice.nuguya.oivs : resolveReturnValue] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
			return aryValues;
		}
		
		if ( aryValues[4].indexOf( "_E_" ) >= 0 )
		{
			String decodedString = this.decode( aryValues[4].substring( 3, aryValues[4].length() ) ).toString();
			aryValues[4] = this.TriDES_DecryptString( this.skData.getBytes(), decodedString.getBytes() );
			aryValues[4] = aryValues[4].replaceAll( "/\1\2\3\4\5\6\7/g", "" );
		}
		
		return (aryValues);
	}

	private byte[] convert8bytes( byte[] srcBytes )
	{
		int nLength = ( srcBytes.length + 8 ) / 8;
		byte[] bytTarget = new byte[ nLength * 8 ];

		for( int nIndex = 0; nIndex < bytTarget.length; nIndex++ )
			bytTarget[nIndex] = 0x00;

		System.arraycopy( srcBytes, 0, bytTarget, 0, srcBytes.length );

		return bytTarget;
	}

	private byte[] addBytes( byte[] arg1, byte[] arg2 )
	{
		byte[] bytStream = new byte[ arg1.length + arg2.length ];

		System.arraycopy( arg1, 0, bytStream, 0, arg1.length );
		System.arraycopy( arg2, 0, bytStream, arg1.length, arg2.length );

		return bytStream;
	}

	/*
	 * Ŭ���̾�Ʈ ������ ��ȣȭ�Ͽ� �����Ѵ�.
	 */

	public boolean desClientData()
	{
		String strCDESInfo = "";
		String[] aryValues = null;
		String strRtnValue = "";
		try
		{
			if ( this.clientData.equals( "" ) )
			{
				this.message = "������� �Է������� ���޵��� �ʾҽ��ϴ�. [nice.nuguya.oivs.inc : desClientData(client data decryption)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
				return false;
			}

			strCDESInfo = new String( this.decode( this.clientData ), CHARSET_DEFAULT );
			aryValues = strCDESInfo.split(DELIMETER_NORMAL );

			if ( aryValues.length < 2 )
			{
				this.message = "������� �Է������� �����Ǿ����ϴ�. [nice.nuguya.oivs.inc : desClientData(client data decryption)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
				return false;
			}

			this.ckData = aryValues[0];
			strCDESInfo = aryValues[1];

			strCDESInfo = this.TriDES_DecryptString( this.ckData.getBytes( CHARSET_DEFAULT ), strCDESInfo.getBytes( CHARSET_DEFAULT ) );
			aryValues = strCDESInfo.split(DELIMETER_NORMAL );

			if ( aryValues.length < 4 )
			{
				this.message = "������� �Է������� �����մϴ�. [nice.nuguya.oivs.inc : desClientData(client data decryption)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
				return false;
			}
		
			this.userNm		= URLDecoder.decode( aryValues[0], CHARSET_SERVER );
			this.resIdNo	= aryValues[1];
			this.inqRsn		= aryValues[2];
			this.foreigner	= aryValues[3];

			return true;
		}
		catch( Exception ex )
		{
			this.message = "�Ǹ�Ȯ�� ���񽺿��� ������ �߻��Ͽ����ϴ�. [nice.nuguya.oivs.inc : desClientData(callSerivce exception)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�" +
				"\\n\\n[��������]\\n" + ex.getMessage();
			ex.printStackTrace();
			return false;
		}
	}
	/*
	 * �Ǹ�Ȯ�� ���񽺸� ȣ���Ѵ�.
	 */
	public boolean callService()
	{
		String strCDESInfo = "";
		String[] aryValues = null;
		String strRtnValue = "";

		if ( this.pingInfo.equals( "" ) || this.niceId.equals( "" ) )
		{
			this.message = "�ѱ��ſ����� ���񽺸� �̿��ϱ� ���� ������ �����ϴ�. [nice.nuguya.oivs.inc : callService(check ping info)]\\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
			return false;
		}
		if( !this.message.equals( "" ))
			return false;
		try
		{

			SecretKey sKey = this.generateRandomKey( SRND_SIZE );
			if ( sKey == null ) return false;

			this.ckData = this.encode( sKey.getEncoded() ).substring( 0, 24 );
			String strCHashedInfo = this.getHashedString( this.niceId + this.pingInfo );

			byte[] bytEncData = this.TriDES_EncryptString( this.ckData.getBytes( CHARSET_DEFAULT ), this.niceId + DELIMETER_NORMAL + 
						this.pingInfo + DELIMETER_NORMAL + strCHashedInfo );

			strCDESInfo = CRND_SIZE + DELIMETER_NORMAL + this.encode( this.addBytes( this.ckData.getBytes( CHARSET_DEFAULT ), bytEncData ) );

			//	���� ȣ���� ó���Ѵ�.
			this.callSecure.setOperationName( new QName( URL_QNAME, "getServiceKey" ) );
			this.callSecure.addParameter( "arg", XMLType.XSD_STRING, ParameterMode.IN );
			this.callSecure.setReturnType( XMLType.XSD_STRING );

			strRtnValue = (String) this.callSecure.invoke( new Object[] { strCDESInfo } );
			aryValues = this.resolveReturnValue( strRtnValue );

			if ( aryValues == null || aryValues.length < 4 )
			{
				this.message = "�Ǹ�Ȯ�� ���񽺿��� ���� ��ſ� �ʿ��� ������ �����մϴ�. [nice.nuguya.oivs.inc : callService(server getServiceKey)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
				return false;
			}
			else if ( ! aryValues[3].equals( "" ) )
			{
				this.message = "�Ǹ�Ȯ�� ���񽺿��� ���� ����߿� ������ �߻��Ͽ����ϴ�. [nice.nuguya.oivs.inc : callService(server getServiceKey)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�" +
						" \\n\\n[��������]\\n\\n" + aryValues[3];
				return false;
			}
			
			this.retCd		= aryValues[1];
			this.retDtlCd	= aryValues[2];

			if ( this.retCd.equals( "0" ) && this.retDtlCd.equals( "0" ) )
			{
				this.skData 		= aryValues[4];
				this.identifier		= aryValues[0];

				this.skData = this.TriDES_DecryptString( this.ckData.getBytes( CHARSET_DEFAULT ), this.decode( this.skData ) ).substring( 0, 24 );
				bytEncData = this.TriDES_EncryptString( this.skData.getBytes( CHARSET_DEFAULT ), this.niceId + DELIMETER_NORMAL + URLEncoder.encode( this.userNm, CHARSET_SERVER ) + DELIMETER_NORMAL + 
								this.resIdNo + DELIMETER_NORMAL + this.inqRsn + DELIMETER_NORMAL + this.foreigner );
				strCDESInfo = this.encode( this.addBytes( ( this.identifier + DELIMETER_NORMAL + SVC_TYPE_PERSONAL + DELIMETER_NORMAL ).getBytes(), this.encode( bytEncData ).getBytes() ) );

				//	���񽺸� ȣ���Ѵ�.
				this.callRealName.setOperationName( new QName( URL_QNAME, "checkRealName" ) );
				this.callRealName.addParameter( "arg", XMLType.XSD_STRING, ParameterMode.IN );
				this.callRealName.setReturnType( XMLType.XSD_STRING );
				
				strRtnValue = (String) this.callRealName.invoke( new Object[] { strCDESInfo } );
				aryValues = this.resolveReturnValue( strRtnValue );
				if ( aryValues == null || aryValues.length < 5 )
				{
					this.message = "�Ǹ�Ȯ�� ������ ��� ������ �����մϴ�. [nice.nuguya.oivs.inc : callService(server checkRealName)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
					return false;
				}
				else if ( ! aryValues[3].equals( "" ) )
				{
					this.message = "�Ǹ�Ȯ�� ���� ���� �߿� ������ �߻��Ͽ����ϴ�. [nice.nuguya.oivs.inc : callService(server checkRealName)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�" +
							" \\n\\n[��������]\\n\\n" + aryValues[3];
					return false;
				}

				if ( ! aryValues[0].equals( this.getHashedString( this.resIdNo ) ) )
				{
					this.message = "�Ǹ�Ȯ�� ������ ����� �����Ǿ� ��Ȯ�� ������ �ƴմϴ�. [nice.nuguya.oivs.inc : callService(server checkRealName.. hash mismatch)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�";
					return false;
				}
				
				this.retCd		= aryValues[1];
				this.retDtlCd	= aryValues[2];
				this.message	= aryValues[3];
				this.minor		= aryValues[4];
				if(aryValues.length > 5) {
				this.dupeinfo = aryValues[5];
				}

				return true;
			}
			else
			{
				this.message = "�Ǹ�Ȯ�� ���񽺿��� ���� ����� ��� ������ �� �����ϴ�. [nice.nuguya.oivs : callService(server checkRealName)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�" +
						"\\n\\n[����ڵ�]\\n\\n" + aryValues[1] + "," + aryValues[2];
				return false;
			}
		}
		catch( Exception ex )
		{
			this.message = "�Ǹ�Ȯ�� ���񽺿��� ������ �߻��Ͽ����ϴ�. [nice.nuguya.oivs.inc : callService(callSerivce exception)] \\n\\n����㼾��(�� 1588-2486) �� �����Ͻʽÿ�" +
				"\\n\\n[��������]\\n" + ex.getMessage();
			ex.printStackTrace();
			return false;
		}
	}
}
%>