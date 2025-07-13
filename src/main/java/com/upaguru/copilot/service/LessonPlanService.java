package com.upaguru.copilot.service;

import com.upaguru.copilot.dtos.LessonPlanReq;
import com.upaguru.copilot.dtos.LessonPlanResp;

public interface LessonPlanService {
    LessonPlanResp generateLessonPlan(LessonPlanReq request);
}

