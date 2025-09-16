package com.example.board.controller;

import com.example.board.entity.Board;
import com.example.board.entity.Reply;
import com.example.board.repository.BoardRepository;
import com.example.board.repository.ReplyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private ReplyRepository replyRepository;

    @GetMapping
    public Page<Board> getBoards(@RequestParam(defaultValue = "0") int page,
                                 @RequestParam(defaultValue = "5") int size) {
        return boardRepository.findAll(PageRequest.of(page, size));
    }

    @PostMapping
    public Board createBoard(@RequestBody Board board) {
        return boardRepository.save(board);
    }

    @GetMapping("/{id}/replies")
    public List<Reply> getReplies(@PathVariable Integer id) {
        return replyRepository.findByBcode(id);
    }

    @PostMapping("/{id}/replies")
    public Reply addReply(@PathVariable Integer id, @RequestBody Reply reply) {
        reply.setBcode(id);
        return replyRepository.save(reply);
    }
}
