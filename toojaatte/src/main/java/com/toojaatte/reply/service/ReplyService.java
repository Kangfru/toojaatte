package com.toojaatte.reply.service;

import java.util.List;

import com.toojaatte.reply.dto.ReplyDTO;
import com.toojaatte.util.page.PageObject;


public interface ReplyService {

	// 1.댓글 리스트 - list()
	public List<ReplyDTO> list(PageObject pageObject, int no);
	// 2.댓글 쓰기 - write(dto)
	public Integer write(ReplyDTO dto);
	// 3.댓글 수정 처리 - update(dto)
	public Integer update(ReplyDTO dto);
	// 4.댓글 삭제 - delete(dto) ==> no와 pw:post 방식
	public Integer delete(ReplyDTO dto);
	

}
