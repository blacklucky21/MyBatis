package member.model.dao;

import org.apache.ibatis.session.SqlSession;

import member.model.vo.Member;

public class MemberDAO {

	public Member selectMember(SqlSession session, Member m) {
		Member member = null;
		
		member = session.selectOne("memberMapper.loginMember",m);
		
		System.out.println(member);
		
		return member;
	}

}
