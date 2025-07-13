package com.upaguru.copilot.broker.impl;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.upaguru.copilot.broker.LessonPlannerBroker;
import com.upaguru.copilot.config.OpenAiConfig;
import com.upaguru.copilot.dtos.LessonPlanReq;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Component
@RequiredArgsConstructor
@Slf4j
public class OpenAiLessonPlannerBroker implements LessonPlannerBroker {

    private final OpenAiConfig config;
    private final RestTemplate restTemplate;

    @Override
    public String generateLessonPlanFromAI(LessonPlanReq request) {
        String prompt = String.format(
                "Generate a detailed lesson plan for:\nSubject: %s\nTopic: %s\nGrade Level: %s",
                request.getSubject(), request.getTopic(), request.getGradeLevel()
        );

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(config.getApiKey());

        Map<String, Object> body = new HashMap<>();
        body.put("model", config.getModel());
        body.put("messages", List.of(Map.of("role", "user", "content", prompt)));

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        try {
            ResponseEntity<ChatResponse> response = restTemplate.exchange(
                    config.getApiUrl(), HttpMethod.POST, entity, ChatResponse.class
            );

            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                return response.getBody().getFirstContent();
            } else {
                log.warn("OpenAI API returned unexpected response: {}", response.getStatusCode());
                return "OpenAI response could not be retrieved.";
            }
        } catch (Exception ex) {
            log.error("OpenAI call failed", ex);
            return "OpenAI integration failed.";
        }
    }

    // Response wrapper for Chat Completion
    static class ChatResponse {
        @JsonProperty("choices")
        private List<Choice> choices;

        public String getFirstContent() {
            if (choices != null && !choices.isEmpty()) {
                return choices.get(0).message.content;
            }
            return null;
        }

        static class Choice {
            @JsonProperty("message")
            private Message message;
        }

        static class Message {
            @JsonProperty("content")
            private String content;
        }
    }
}

