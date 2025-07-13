package com.upaguru.copilot.persistence;

import com.upaguru.copilot.dtos.LessonPlanReq;

public interface LessonPlanAuditPersistence {
    void saveRequest(LessonPlanReq request, String response);
}

