package com.upaguru.copilot.service.impl;

import com.upaguru.copilot.broker.LessonPlannerBroker;
import com.upaguru.copilot.dtos.LessonPlanReq;
import com.upaguru.copilot.dtos.LessonPlanResp;
import com.upaguru.copilot.persistence.LessonPlanAuditPersistence;
import com.upaguru.copilot.service.LessonPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LessonPlanServiceImpl implements LessonPlanService {
    private final LessonPlannerBroker broker;
    private final LessonPlanAuditPersistence persistence;

    @Override
    public LessonPlanResp generateLessonPlan(LessonPlanReq request) {
        String content = broker.generateLessonPlanFromAI(request);
        persistence.saveRequest(request, content);
        return new LessonPlanResp(content);
    }
}

