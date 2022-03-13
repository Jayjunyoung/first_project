package my.service;

public class BadPasswordException extends ServiceException {
	public BadPasswordException(String message){
		super(message);  //super? ServiceException
	}
}
