# API Guide - Liquidity Risk Indicators

## 📡 REST API Documentation

This document describes the REST API endpoints for interacting with the Liquidity Risk Indicators process via KIE Server.

---

## Base URL

```
http://localhost:8080/kie-server/services/rest/server
```

**Authentication**: Basic Auth
- Username: `admin` (or appropriate user)
- Password: `admin`

---

## 🚀 Process Management APIs

### 1. Start Process Instance

Start a new Liquidity Risk Indicators process.

**Endpoint:**
```
POST /containers/{containerId}/processes/{processId}/instances
```

**Parameters:**
- `containerId`: `liquidity-risk-jbpm_2.3.0`
- `processId`: `LiquidityRiskIndicators`

**Request Body:**
```json
{
  "report": {
    "employeeId": "EMP001",
    "employeeName": "Ahmed Hassan",
    "managerId": "MGR001",
    "managerName": "Sara Mohamed",
    "directorId": "DIR001",
    "directorName": "Ali Ibrahim"
  }
}
```

**Example:**
```bash
curl -X POST \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/processes/LiquidityRiskIndicators/instances' \
  -H 'Authorization: Basic YWRtaW46YWRtaW4=' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{
    "report": {
        "employeeId": "EMP001",
        "employeeName": "Ahmed Hassan",
        "managerId": "MGR001",
        "managerName": "Sara Mohamed",
        "directorId": "DIR001",
        "directorName": "Ali Ibrahim"
    }
}'
```

**Response:**
```json
{
  "processInstanceId": 123
}
```

---

### 2. Get Process Instance Details

Retrieve details of a specific process instance.

**Endpoint:**
```
GET /containers/{containerId}/processes/instances/{processInstanceId}
```

**Example:**
```bash
curl -X GET \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/processes/instances/123' \
  -H 'Authorization: Basic YWRtaW46YWRtaW4=' \
  -H 'Accept: application/json'
```

**Response:**
```json
{
  "process-instance-id": 123,
  "process-id": "LiquidityRiskIndicators",
  "process-name": "Liquidity Risk Indicators Process",
  "process-version": "1.0",
  "process-instance-state": 1,
  "container-id": "liquidity-risk-jbpm_2.3.0",
  "initiator": "admin",
  "start-date": "2025-12-18T10:00:00.000Z",
  "process-instance-desc": "Liquidity Risk Report",
  "correlation-key": "",
  "parent-instance-id": -1,
  "sla-compliance": 0,
  "sla-due-date": null,
  "active-user-tasks": {
    "task-summary": [
      {
        "task-id": 456,
        "task-name": "Screen 1: Period Selection"
      }
    ]
  }
}
```

---

### 3. Abort Process Instance

Abort a running process instance.

**Endpoint:**
```
DELETE /containers/{containerId}/processes/instances/{processInstanceId}
```

**Example:**
```bash
curl -X DELETE \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/processes/instances/123' \
  -H 'Authorization: Basic YWRtaW46YWRtaW4='
```

---

## 📋 Task Management APIs

### 4. Get Tasks for User

Retrieve all tasks assigned to a specific user.

**Endpoint:**
```
GET /queries/tasks/instances/pot-owners
```

**Query Parameters:**
- `user`: Username
- `page`: Page number (0-based)
- `pageSize`: Number of results per page
- `status`: Task status (Reserved, InProgress, Completed)

**Example:**
```bash
curl -X GET \
  'http://localhost:8080/kie-server/services/rest/server/queries/tasks/instances/pot-owners?user=EMP001&page=0&pageSize=10' \
  -H 'Authorization: Basic RU1QMDAxOnBhc3N3b3Jk' \
  -H 'Accept: application/json'
```

**Response:**
```json
{
  "task-summary": [
    {
      "task-id": 456,
      "task-name": "Screen 1: Period Selection",
      "task-subject": "",
      "task-description": "",
      "task-status": "Reserved",
      "task-priority": 0,
      "task-is-skipable": false,
      "task-actual-owner": "EMP001",
      "task-created-by": "admin",
      "task-created-on": "2025-12-18T10:00:00.000Z",
      "task-activation-time": "2025-12-18T10:00:00.000Z",
      "task-proc-inst-id": 123,
      "task-proc-def-id": "LiquidityRiskIndicators",
      "task-container-id": "liquidity-risk-jbpm_2.3.0"
    }
  ]
}
```

---

### 5. Get Task Details

Retrieve detailed information about a specific task.

**Endpoint:**
```
GET /containers/{containerId}/tasks/{taskId}
```

**Example:**
```bash
curl -X GET \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/tasks/456' \
  -H 'Authorization: Basic RU1QMDAxOnBhc3N3b3Jk' \
  -H 'Accept: application/json'
```

---

### 6. Start Task

Claim and start a task.

**Endpoint:**
```
PUT /containers/{containerId}/tasks/{taskId}/states/started
```

**Query Parameters:**
- `user`: Username claiming the task

**Example:**
```bash
curl -X PUT \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/tasks/456/states/started?user=EMP001' \
  -H 'Authorization: Basic RU1QMDAxOnBhc3N3b3Jk'
```

---

### 7. Complete Task

Complete a task with output data.

**Endpoint:**
```
PUT /containers/{containerId}/tasks/{taskId}/states/completed
```

**Query Parameters:**
- `user`: Username completing the task
- `auto-progress`: true/false (automatically progress to next task)

**Request Body (Screen 1 - Period Selection):**
```json
{
  "selectedYear": 2025,
  "selectedQuarterRange": "Q1_Q2"
}
```

**Example:**
```bash
curl -X PUT \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/tasks/456/states/completed?user=EMP001&auto-progress=true' \
  -H 'Authorization: Basic RU1QMDAxOnBhc3N3b3Jk' \
  -H 'Content-Type: application/json' \
  -d '{
    "selectedYear": 2025,
    "selectedQuarterRange": "Q1_Q2"
  }'
```

---

### 8. Complete Task - Screen 2 (Indicators Display)

**Request Body:**
```json
{
  "employeeComment": "The liquidity indicators show stable trends for Q1-Q2 2025. LCR and NSFR are within acceptable ranges.",
  "action": "SUBMIT"
}
```

**Example:**
```bash
curl -X PUT \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/tasks/457/states/completed?user=EMP001' \
  -H 'Authorization: Basic RU1QMDAxOnBhc3N3b3Jk' \
  -H 'Content-Type: application/json' \
  -d '{
    "employeeComment": "The liquidity indicators show stable trends.",
    "action": "SUBMIT"
  }'
```

---

### 9. Complete Task - Screen 3 (Manager Review)

**Request Body:**
```json
{
  "managerComment": "Reviewed and approved. Indicators are satisfactory.",
  "managerDecision": "SUBMIT"
}
```

**For Return:**
```json
{
  "managerComment": "Please provide more detailed analysis for the LCR increase.",
  "managerDecision": "RETURN"
}
```

**Example:**
```bash
curl -X PUT \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/tasks/458/states/completed?user=MGR001' \
  -H 'Authorization: Basic TUdSMDAxOnBhc3N3b3Jk' \
  -H 'Content-Type: application/json' \
  -d '{
    "managerComment": "Reviewed and approved.",
    "managerDecision": "SUBMIT"
  }'
```

---

### 10. Complete Task - Screen 4 (Director Approval)

**Request Body:**
```json
{
  "directorComment": "Final approval granted. Report archived."
}
```

**Example:**
```bash
curl -X PUT \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/tasks/459/states/completed?user=DIR001' \
  -H 'Authorization: Basic RElSMDAxOnBhc3N3b3Jk' \
  -H 'Content-Type: application/json' \
  -d '{
    "directorComment": "Final approval granted."
  }'
```

---

## 🔍 Query APIs

### 11. Get Process Variables

Retrieve all variables for a process instance.

**Endpoint:**
```
GET /containers/{containerId}/processes/instances/{processInstanceId}/variables
```

**Example:**
```bash
curl -X GET \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/processes/instances/123/variables' \
  -H 'Authorization: Basic YWRtaW46YWRtaW4=' \
  -H 'Accept: application/json'
```

**Response:**
```json
{
  "report": {
    "reportId": 123,
    "selectedYear": 2025,
    "selectedQuarterRange": "Q1_Q2",
    "status": "SUBMITTED_TO_MANAGER",
    "currentStage": "SCREEN_3",
    "employeeComment": "Indicators show stable trends.",
    "lcrIndicator": {
      "indicatorType": "LCR",
      "q1Result": 1.25,
      "q2Result": 1.30,
      "absoluteCoverage": 0.05
    }
  }
}
```

---

### 12. Get Active Tasks for Process

Retrieve active tasks for a specific process instance.

**Endpoint:**
```
GET /containers/{containerId}/processes/instances/{processInstanceId}/tasks
```

**Example:**
```bash
curl -X GET \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/processes/instances/123/tasks' \
  -H 'Authorization: Basic YWRtaW46YWRtaW4=' \
  -H 'Accept: application/json'
```

---

## 📊 Custom Service APIs

### 13. Calculate Indicators (Custom Endpoint)

If you create a custom REST endpoint for calculations:

**Endpoint:**
```
POST /services/liquidity/calculate
```

**Request Body:**
```json
{
  "indicatorType": "LCR",
  "year": 2025,
  "quarterRange": "Q1_Q2",
  "month1": 1.20,
  "month2": 1.25,
  "month3": 1.30,
  "month4": 1.28,
  "month5": 1.32,
  "month6": 1.35
}
```

**Response:**
```json
{
  "q1Result": 1.25,
  "q2Result": 1.32,
  "absoluteCoverage": 0.07
}
```

---

## 🔐 Authentication Examples

### Basic Authentication

```bash
# Using username:password
curl -u admin:admin http://localhost:8080/kie-server/services/rest/server

# Using Base64 encoded credentials
echo -n "admin:admin" | base64
# Output: YWRtaW46YWRtaW4=

curl -H "Authorization: Basic YWRtaW46YWRtaW4=" http://localhost:8080/kie-server/services/rest/server
```

---

## 📝 Complete Workflow Example

### Full Process Execution via API

```bash
#!/bin/bash

BASE_URL="http://localhost:8080/kie-server/services/rest/server"
CONTAINER_ID="liquidity-risk-jbpm_2.3.0"
AUTH="admin:admin"

# 1. Start Process
echo "Starting process..."
PROCESS_ID=$(curl -s -X POST \
  "$BASE_URL/containers/$CONTAINER_ID/processes/LiquidityRiskIndicators/instances" \
  -u "$AUTH" \
  -H 'Content-Type: application/json' \
  -d '{
    "report": {
      "employeeId": "EMP001",
      "managerId": "MGR001",
      "directorId": "DIR001"
    }
  }' | jq -r '.')

echo "Process started with ID: $PROCESS_ID"

# 2. Get Screen 1 Task
TASK_1=$(curl -s -X GET \
  "$BASE_URL/queries/tasks/instances/pot-owners?user=EMP001" \
  -u "EMP001:password" | jq -r '.["task-summary"][0]["task-id"]')

echo "Screen 1 Task ID: $TASK_1"

# 3. Complete Screen 1
curl -X PUT \
  "$BASE_URL/containers/$CONTAINER_ID/tasks/$TASK_1/states/completed?user=EMP001" \
  -u "EMP001:password" \
  -H 'Content-Type: application/json' \
  -d '{
    "selectedYear": 2025,
    "selectedQuarterRange": "Q1_Q2"
  }'

echo "Screen 1 completed"

# 4. Get Screen 2 Task
TASK_2=$(curl -s -X GET \
  "$BASE_URL/queries/tasks/instances/pot-owners?user=EMP001" \
  -u "EMP001:password" | jq -r '.["task-summary"][0]["task-id"]')

# 5. Complete Screen 2
curl -X PUT \
  "$BASE_URL/containers/$CONTAINER_ID/tasks/$TASK_2/states/completed?user=EMP001" \
  -u "EMP001:password" \
  -H 'Content-Type: application/json' \
  -d '{
    "employeeComment": "Indicators reviewed and satisfactory.",
    "action": "SUBMIT"
  }'

echo "Screen 2 completed"

# Continue for Screen 3 and 4...
```

---

## 🛠️ Error Handling

### Common Error Responses

**401 Unauthorized:**
```json
{
  "type": "UNEXPECTED",
  "message": "User admin is not authenticated"
}
```

**404 Not Found:**
```json
{
  "type": "TASK_NOT_FOUND",
  "message": "Could not find task instance with id \"456\""
}
```

**500 Internal Server Error:**
```json
{
  "type": "PROCESS_INSTANCE_ERROR",
  "message": "Error starting process instance",
  "stacktrace": "..."
}
```

---

## 📚 Additional Resources

- [KIE Server REST API Documentation](https://docs.jboss.org/jbpm/release/latest/jbpm-docs/html_single/#_kie_server_rest_api)
- [jBPM Process API](https://docs.jbpm.org/latest/jbpm-docs/html_single/#_process_management)
- [Task Service API](https://docs.jbpm.org/latest/jbpm-docs/html_single/#_task_service)

---

**Last Updated**: December 2025
