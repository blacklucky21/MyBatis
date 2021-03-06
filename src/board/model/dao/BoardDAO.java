package board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import board.model.exception.BoardException;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import board.model.vo.SearchCondition;

public class BoardDAO {

	public int getListcount(SqlSession session) throws BoardException {
		int listCount = 0;
		
		listCount = session.selectOne("boardMapper.selectListCount");
		
		if(listCount <=0) {
			session.close();
			throw new BoardException("게시물 조회에 실패하였습니다");
		}
		
		return listCount;
		
		
	}

	public ArrayList<Board> selectBoardList(SqlSession session, PageInfo pi) throws BoardException {
		ArrayList<Board> list = null; //게시글 목록 담을 변수 선언
		
		// offset : 몇 개의 게시글을 건너 뛰고 조회 할지 계산해둔 변수
		int offset = (pi.getCurrentPage()-1) *pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		list = (ArrayList)session.selectList("boardMapper.selectBoardList",null ,rowBounds);
		
		if(list ==null) {
			session.close();
			throw new BoardException("게시글 조회에 실패하였습니다.");
		}
		
		
		return list;
	}

	public int updateCount(SqlSession session, int bId) throws BoardException {
		
		int result = session.update("boardMapper.updateBoardCount", bId);
		System.out.println("시발럼아"+result);
		if(result<=0) {
			session.rollback();
			session.close();
			
			throw new BoardException("게시글 조회수 증가에 실패하였습니다.");
		}
		
		return result;
		
	}

	public Board selectBoardDetail(SqlSession session, int bid) throws BoardException {
		Board b = session.selectOne("boardMapper.selectBoardDetail",bid);
		
		if(b==null) {
			session.close();
			throw new BoardException("게시글 상세조회에 실패 하였습니다.");
		}
		return b;
	}

	   // 검색되는거 
	   public int getSearchResultListCount(SqlSession session, SearchCondition sc) throws BoardException {
	      int listCount = 0;
	      
	      listCount = session.selectOne("boardMapper.selectSearchResultCount",sc);
	      // 갯수 가지고 오고
	      
	      if(listCount <= 0) {
	         session.close();
	         throw new BoardException("검색결과의 개수 조회에 실패하였습니다.");
	      }
	      
	      
	      return listCount;
	   }

	public ArrayList<Board> selectSearchResultList(SqlSession session, SearchCondition sc, PageInfo pi) throws BoardException {
		
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		list =(ArrayList)session.selectList("boardMapper.selectSearchResultList",sc,rowBounds);
		
		
		if(list ==null) {
			session.close();
			throw new BoardException("검색 결과 리스트 조회에 실패하였습니다");
		}
		return list;
	}

}
