package member.model.service;

import static common.Template.*;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import member.model.dao.MemberDAO;
import member.model.exception.MemberException;
import member.model.vo.Member;

public class MemberService {

	public Member selectMember(Member m) throws MemberException {
		
		SqlSession session = getSqlSession();
		
		
		Member member = new MemberDAO().selectMember(session,m);
		
		return member;
	}

	public void insertMember(Member m) throws MemberException {
		
		SqlSession session = getSqlSession();
		
		new MemberDAO().insertMember(session,m);
		session.commit(); //DAO에서 해주지않고 service단에서 해준다
		session.close();
	}

	public void updateMember(Member m) throws MemberException {
		SqlSession session = getSqlSession();
		
		new MemberDAO().updateMember(session,m);
		session.commit();
		session.close();
	}

	public void pwdUpdate(HashMap<String, String> map) throws MemberException {
		
		SqlSession session = getSqlSession();
		
		new MemberDAO().pwdUpdate(session,map);
		
		session.commit();
		session.close();
		
	}

	public void deleteMember(String userId) throws MemberException {
		
		SqlSession session = getSqlSession();
		
		new MemberDAO().deleteMember(session,userId);
		
		session.commit();
		session.close();
		
	}



}
