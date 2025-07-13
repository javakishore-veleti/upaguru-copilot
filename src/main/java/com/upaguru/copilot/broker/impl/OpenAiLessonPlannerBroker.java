package com.upaguru.copilot.broker.impl;

import com.upaguru.copilot.broker.LessonPlannerBroker;
import com.upaguru.copilot.config.OpenAiConfig;
import com.upaguru.copilot.dtos.LessonPlanReq;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
@RequiredArgsConstructor
public class OpenAiLessonPlannerBroker implements LessonPlannerBroker {

    private final OpenAiConfig config;
    private final RestTemplate restTemplate;

    @Override
    public String generateLessonPlanFromAI(LessonPlanReq request) {
        // Placeholder for OpenAI integration
        return String.format("Lesson plan for %s: %s", request.getSubject(), request.getTopic());
    }
}

