package common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {
	public static SqlSession getSqlSession() {
		
		///SqlSession 안에서 commit rollback 을 다 제공해주고있다 ㅇㅇ.
		SqlSession session = null;
		
		try {
			InputStream stream = Resources.getResourceAsStream("/mybatis-config.xml");
			
			// SqlSession <== (interface) SqlSessionFactory.openSession()
			// sqlSessionFactory <== SqlSessionFactoryBuilder.build()
			
			
			/*
			 * SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
			 * SqlSessionFactory ssf = ssfb.build(stream);
			 * session = ssf.openSession(false);
			 */
			
			session = new SqlSessionFactoryBuilder().build(stream).openSession(false);
			
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return session;
	}
}
