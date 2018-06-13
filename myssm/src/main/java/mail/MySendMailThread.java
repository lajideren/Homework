package mail;

import com.sun.mail.util.MailSSLSocketFactory;
import po.User;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class MySendMailThread extends Thread {

	private User user = null;

	public MySendMailThread(User user) {
		this.user = user;
	}

	@Override
	public void run() {

		// 跟smtp服务器建立一个连接
		Properties p = new Properties();
		// 设置邮件服务器主机名
		p.setProperty("mail.host", "smtp.qq.com");// 指定邮件服务器，默认端口 25
		// 发送服务器需要身份验证
		p.setProperty("mail.smtp.auth", "true");// 要采用指定用户名密码的方式去认证
		// 发送邮件协议名称
		p.setProperty("mail.transport.protocol", "smtp");

		// 开启SSL加密，否则会失败
		MailSSLSocketFactory sf = null;
		try {
			sf = new MailSSLSocketFactory();
		} catch (GeneralSecurityException e1) {
			e1.printStackTrace();
		}
		sf.setTrustAllHosts(true);
		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.ssl.socketFactory", sf);

		// 开启debug调试，以便在控制台查看
		// session.setDebug(true);也可以这样设置
		// p.setProperty("mail.debug", "true");

		// 创建session
		Session session = Session.getDefaultInstance(p, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// 用户名可以用QQ账号也可以用邮箱的别名
				PasswordAuthentication pa = new PasswordAuthentication(
						"490761123", "vfxehhubowrwbidc");
				// 后面的字符是授权码，用qq密码不行！！
				return pa;
			}
		});

		session.setDebug(true);// 设置打开调试状态

		try {
			// 声明一个Message对象(代表一封邮件),从session中创建
			MimeMessage msg = new MimeMessage(session);
			// 邮件信息封装
			// 1发件人
			msg.setFrom(new InternetAddress("490761123@qq.com"));
			// 2收件人
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
			// 3邮件内容:主题、内容
			msg.setSubject(user.getUsername() + ",欢迎注册***账号,请点击链接激活账号");

			// StringBuilder是线程不安全的,但是速度快，这里因为只会有这个线程来访问，所以可以用这个
			StringBuilder sbd = new StringBuilder();
			sbd.append(user.getUsername() + "<br/>欢迎！请确认此邮件地址以激活您的账号。<br/>");
			sbd.append("<font color='red'><a href='http://localhost:8080/active.action?code="
					+ user.getCode() + "' target='_blank'");
			sbd.append(">立即激活</a></font><br/>");
			sbd.append("或者点击下面链接:<br/>");
			sbd.append("http://localhost:8080/active.action?code="
					+ user.getCode() + "<br/>");
			sbd.append("这是一封自动发送的邮件；如果您并未要求但收到这封信件，您不需要进行任何操作。");

			msg.setContent(sbd.toString(), "text/html;charset=utf-8");// 发html格式的文本

			// 发送动作
			Transport.send(msg);
			
			System.out.println("给" + user.getEmail() + "发送邮件成功。");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}


	}
}