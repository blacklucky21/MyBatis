package member.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import member.model.exception.MemberException;
import member.model.vo.Member;

public class MemberDAO {

	public Member selectMember(SqlSession session, Member m) throws MemberException {
		Member member = null;
		
		member = session.selectOne("memberMapper.loginMember",m);
		
		System.out.println(member);
		
		if(member==null) { //조회가 되지 않았을 때
			session.close();
			throw new MemberException("로그인에 실패 하였습니다.");
			
			//thorw 억지로 Exception을 발생시킨다
			//thorws는 메소드나 생성자를 수행할 때 발생하는 Exception을 선언 할때 사용
		}
		
		return member;
	}

	

	public void insertMember(SqlSession session, Member m) throws MemberException {
		
		int result = 0;
		
		 result = session.insert("memberMapper.insertMember",m);
		
		
		 if(result<=0) {
			 session.rollback();
			 session.close();
			 throw new MemberException("회원가입에 실패하였습니다.");
		 }
		
	}



	public void updateMember(SqlSession session, Member m) throws MemberException {
			
		int result = session.update("memberMapper.updateMember",m);
		
		if(result<=0) {
			
			session.rollback();
			session.close();
			throw new MemberException("회원정보 수정에 실패하였습니다.");
			
		}
		
		
	}



	public void pwdUpdate(SqlSession session, HashMap<String, String> map) throws MemberException {
		
		int result = session.update("memberMapper.updatePwd",map);
		
		
		if(result<=0) {
			session.rollback();
			session.close();
			
			throw new MemberException("비밀번호 수정에 실패하였습니다");
		}
	}



	public void deleteMember(SqlSession session, String userId) throws MemberException {
		
		int result = session.delete("memberMapper.deleteMember",userId);
		
		if(result<=0) {
			session.rollback();
			session.close();
			
			throw new MemberException("회원탈퇴에 실패하였습니다");
		}
		
	}

}
