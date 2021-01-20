package com.ssh.pjt.common;

import com.ssh.pjt.dto.PagingDto;
import com.ssh.pjt.form.PagingForm;


public class PagingResult {
	 public static PagingForm setPageUtil(PagingDto pagingDto) {
		 
		 	PagingForm pagingForm = new PagingForm();
	 
	        String pagination = ""; // 페이징 결과 값
	        String functionName = pagingDto.getFunction_name(); // 페이징 목록을 요청하는 자바스크립트 함수명
	        int currentPage = pagingDto.getCurrent_page_no(); // 현재 페이지 번호
	        int countPerList = pagingDto.getCount_per_list(); // 한 화면에 출력될 게시물 수
	        int countPerPage = pagingDto.getCount_per_page(); // 한 화면에 출력될 페이지 수
	        int totalListCount = pagingDto.getTatal_list_count(); // 총 게시물 수
	        int totalPageCount = totalListCount / countPerList; // 총 페이지 수
	        if (totalListCount % countPerList > 0) { // 총 페이수를 구할 때 int형으로 계산하면 나머지가 있는 경우 게시물이 존재하기 때문에 총 페이지의 수를 수정
	            totalPageCount = totalPageCount + 1;
	        }
	 
	        int viewFirstPage = (((currentPage - 1) / countPerPage) * countPerPage) + 1; // 한 화면에 첫 페이지 번호
	        int ViewLastPage = viewFirstPage + countPerPage - 1; // 한 화면에 마지막 페이지 번호
	        if (ViewLastPage > totalPageCount) { // 마지막 페이지의 수가 총 페이지의 수보다 큰 경우는 게시물이 존재하지 않기 때문에 마지막 페이지의 수를 수정
	            ViewLastPage = totalPageCount;
	        }
	 
	        int totalFirstPage = 1; // 전체 페이지 중에 처음 페이지
	        int totalLastPage = totalPageCount; // 전체 페이지 중에 마지막 페이지
	        int prePerPage = 0; // 이전 화면에 첫번째 번호
	        if (viewFirstPage - countPerPage > 0) {
	            prePerPage = viewFirstPage - countPerPage;
	        } else {
	            prePerPage = totalFirstPage;
	        }
	        int nextPerPage = 0; // 이후 화면에 첫번째 번호
	        if (viewFirstPage + countPerPage < totalPageCount) {
	            nextPerPage = viewFirstPage + countPerPage;
	        } else {
	            nextPerPage = totalPageCount;
	        }
	 
	        // 페이지 네이게이션 설정
	        
	        pagination += "<nav aria-label='Page navigation example'>";
	        pagination += "<ul class='pagination justify-content-center'>";
	        pagination += "<li class='page-item disable'><a class='page-link' tabindex='-1' aria-disabled='true' href='javascript:" + functionName + "(" + totalFirstPage + ");'>&laquo;&laquo;</a></li>";
	        pagination += "<li class='page-item disable'><a class='page-link' tabindex='-1' aria-disabled='true' href='javascript:" + functionName + "(" + prePerPage + ");'>&laquo;</a></li>";
	        for (int a = viewFirstPage; a <= ViewLastPage; a++) {
	            if (a == currentPage) {
	                pagination += "<li class='page-item'><a class='page-link' href='javascript:" + functionName + "(\"" + a + "\");' >" + a + "</a></li>";
	            } else {
	                pagination += "<li class='page-item'><a class='page-link' href='javascript:" + functionName + "(\"" + a + "\");'>" + a + "</a></li>";
	            }
	        }
	        pagination += "<li class='page-item disable'><a class='page-link' tabindex='-1' aria-disabled='true' href='javascript:" + functionName + "(" + nextPerPage + ");'>&raquo;</a></li>";
	        pagination += "<li class='page-item disable'><a class='page-link' tabindex='-1' aria-disabled='true' href='javascript:" + functionName + "(" + totalLastPage + ");'>&raquo;&raquo;</a></li>";
	        pagination += "</ul>";
	        pagination += "</nav>";

	 
	        int offset = ((currentPage - 1) * countPerList); // 한 화면의 표출되는 게시물의 시작 번호 (쿼리 조건절)
	 
	        // LIMIT는 가져올 row의 수, OFFSET은 몇 번째 row부터 가져올지를 결정
	        pagingForm.setLimit(countPerList);
	        pagingForm.setOffset(offset);
	        pagingForm.setPagination(pagination);
	 
	        return pagingForm;
	    }
}
