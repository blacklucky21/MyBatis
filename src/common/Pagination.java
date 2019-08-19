package common;

import board.model.vo.PageInfo;

public class Pagination {
	//페이지 정보 값들을 계산해서 PageInfo 객체 변환 클래스
	
	public static PageInfo getPageInfo(int currentPage,int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 10; // 한 페이지에서 보이는 페이징 수
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 5; // 한 페이지에서 보이는 게시글 수
		
		
		maxPage = (int)((double)listCount / boardLimit +0.9);
		startPage = ((int)((double)currentPage / pageLimit + 0.9)-1)*pageLimit +1;
		
		endPage = startPage + pageLimit -1;
		
		if(maxPage < endPage) {
			
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		return pi;
		
	}

}
