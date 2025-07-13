#!/bin/bash

echo '🧠 Creating Java class stubs for upaguru-copilot...'

echo '// REST Controller' > src/main/java/com/upaguru/copilot/controller/LessonPlanController.java
echo '// Service Interface' > src/main/java/com/upaguru/copilot/service/LessonPlanService.java
echo '// Service Implementation' > src/main/java/com/upaguru/copilot/service/impl/LessonPlanServiceImpl.java
echo '// Broker Interface' > src/main/java/com/upaguru/copilot/broker/LessonPlannerBroker.java
echo '// Broker Implementation' > src/main/java/com/upaguru/copilot/broker/impl/OpenAiLessonPlannerBroker.java
echo '// Persistence Interface' > src/main/java/com/upaguru/copilot/persistence/LessonPlanAuditPersistence.java
echo '// Persistence Implementation' > src/main/java/com/upaguru/copilot/persistence/impl/LessonPlanAuditPersistenceImpl.java
echo '// JPA Repository' > src/main/java/com/upaguru/copilot/persistence/jpa/LessonPlanAuditRepository.java
echo '// Request DTO' > src/main/java/com/upaguru/copilot/dtos/LessonPlanReq.java
echo '// Response DTO' > src/main/java/com/upaguru/copilot/dtos/LessonPlanResp.java
echo '// Entity' > src/main/java/com/upaguru/copilot/entity/LessonPlanAudit.java
echo '// Configuration Class' > src/main/java/com/upaguru/copilot/config/OpenAiConfig.java
echo '// Main Application Class' > src/main/java/com/upaguru/copilot/UpaguruCopilotApplication.java

echo '✅ Java source files generated.'