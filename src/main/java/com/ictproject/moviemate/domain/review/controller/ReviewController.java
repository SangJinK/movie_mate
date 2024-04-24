package com.ictproject.moviemate.domain.review.controller;


import com.ictproject.moviemate.domain.review.Review;
import com.ictproject.moviemate.domain.review.dto.ReviewRequestDTO;
import com.ictproject.moviemate.domain.review.dto.ReviewDetailResponseDTO;
import com.ictproject.moviemate.domain.review.dto.ReviewResponseDTO;
import com.ictproject.moviemate.domain.review.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/review")
@RequiredArgsConstructor
@Slf4j
public class ReviewController {
	private final ReviewService reviewService;

	@PostMapping("/create")
	public ResponseEntity<?> create(@RequestBody ReviewRequestDTO dto, HttpSession session, BindingResult result) {
		log.info("/api/v1/review/" + dto + " POST!");

		if (result.hasErrors()) {
			return ResponseEntity
					.badRequest()
					.body(result.toString());
		}

		Review review = Review.builder()
				.userId(dto.getUserId())
				.movieCd(String.valueOf(dto.getMovieCd()))
				.text(dto.getText())
				.grade(dto.getGrade())
				.movieName(dto.getMovieName())
				.build();
		log.info("ReviewRequestDTO : {}", dto);

		reviewService.insertReview(review);
		return ResponseEntity.ok().body("success");
	}

	@GetMapping("/detail/{movieCd}/reviews")
	public ResponseEntity<?> list(@PathVariable("movieCd") String movieCd) {
		log.info("/api/v1/review/" + movieCd + " GET!");

		List<ReviewDetailResponseDTO> reviews = reviewService.getReview(movieCd);
		log.info("reviews : {}", reviews);

		ReviewResponseDTO dto = new ReviewResponseDTO(movieCd, reviews);

		return ResponseEntity.ok().body(dto);
	}
}
