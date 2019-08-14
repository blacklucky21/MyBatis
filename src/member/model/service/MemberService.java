package member.model.service;

import static common.Template.*;

import org.apache.ibatis.session.SqlSession;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public Member selectMember(Member m) {
		
		SqlSession session = getSqlSession();
		
		
		Member member = new MemberDAO().selectMember(session,m);
		
		return member;
	}



}
