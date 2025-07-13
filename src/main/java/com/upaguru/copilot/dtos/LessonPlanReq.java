package com.upaguru.copilot.dtos;

import lombok.Data;

@Data
public class LessonPlanReq {
    private String subject;
    private String topic;
    private String gradeLevel;
    private String duration;
}

