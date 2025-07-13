package com.upaguru.copilot.broker;

import com.upaguru.copilot.dtos.LessonPlanReq;

public interface LessonPlannerBroker {
    String generateLessonPlanFromAI(LessonPlanReq request);
}

