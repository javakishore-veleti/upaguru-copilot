package com.upaguru.copilot.controller;

import com.upaguru.copilot.dtos.LessonPlanReq;
import com.upaguru.copilot.dtos.LessonPlanResp;
import com.upaguru.copilot.service.LessonPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/lesson-plan")
@RequiredArgsConstructor
public class LessonPlanController {
    private final LessonPlanService lessonPlanService;

    @PostMapping
    public ResponseEntity<LessonPlanResp> generate(@RequestBody LessonPlanReq req) {
        return ResponseEntity.ok(lessonPlanService.generateLessonPlan(req));
    }
}

