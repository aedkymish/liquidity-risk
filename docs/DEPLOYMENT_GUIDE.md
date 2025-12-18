# Deployment Guide - Liquidity Risk Indicators jBPM Process

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Environment Setup](#environment-setup)
3. [Database Configuration](#database-configuration)
4. [jBPM Server Installation](#jbpm-server-installation)
5. [Project Deployment](#project-deployment)
6. [Configuration](#configuration)
7. [Testing Deployment](#testing-deployment)
8. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Software Requirements

- **Java JDK**: 11 or higher
- **Maven**: 3.6.0 or higher
- **jBPM Server**: 7.74.1 (Business Central + KIE Server)
- **Database**: PostgreSQL 12+ or MySQL 8.0+
- **Application Server**: WildFly 26 or higher
- **Git**: For version control

### Hardware Requirements

- **RAM**: Minimum 8 GB (16 GB recommended)
- **CPU**: 4 cores minimum
- **Disk Space**: 10 GB minimum for application and logs

---

## Environment Setup

### 1. Install Java

```bash
# Check Java version
java -version

# Should output Java 11 or higher
# If not installed, download from:
# https://adoptium.net/
```

### 2. Install Maven

```bash
# Check Maven version
mvn -version

# Should output Maven 3.6.0 or higher
# If not installed, download from:
# https://maven.apache.org/download.cgi
```

### 3. Download jBPM

```bash
# Download jBPM 7.74.1
wget https://download.jboss.org/jbpm/release/7.74.1.Final/jbpm-server-7.74.1.Final-dist.zip

# Extract
unzip jbpm-server-7.74.1.Final-dist.zip
cd jbpm-server-7.74.1.Final
```

---

## Database Configuration

### PostgreSQL Setup

#### 1. Create Database

```sql
-- Connect to PostgreSQL
psql -U postgres

-- Create database
CREATE DATABASE liquiditydb;

-- Create user
CREATE USER liquidityuser WITH PASSWORD 'yourpassword';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE liquiditydb TO liquidityuser;

-- Connect to the database
\c liquiditydb

-- Create tables (jBPM will auto-create schema if configured)
```

#### 2. Configure DataSource in WildFly

Create file: `standalone/configuration/standalone.xml`

Add datasource configuration:

```xml
<datasource jndi-name="java:jboss/datasources/LiquidityDS"
            pool-name="LiquidityDS"
            enabled="true"
            use-java-context="true">
    <connection-url>jdbc:postgresql://localhost:5432/liquiditydb</connection-url>
    <driver>postgresql</driver>
    <security>
        <user-name>liquidityuser</user-name>
        <password>yourpassword</password>
    </security>
    <validation>
        <valid-connection-checker class-name="org.jboss.jca.adapters.jdbc.extensions.postgres.PostgreSQLValidConnectionChecker"/>
        <exception-sorter class-name="org.jboss.jca.adapters.jdbc.extensions.postgres.PostgreSQLExceptionSorter"/>
    </validation>
</datasource>

<drivers>
    <driver name="postgresql" module="org.postgresql">
        <xa-datasource-class>org.postgresql.xa.PGXADataSource</xa-datasource-class>
    </driver>
</drivers>
```

#### 3. Add PostgreSQL Driver Module

Create directory: `modules/org/postgresql/main/`

Create `module.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<module xmlns="urn:jboss:module:1.5" name="org.postgresql">
    <resources>
        <resource-root path="postgresql-42.5.0.jar"/>
    </resources>
    <dependencies>
        <module name="javax.api"/>
        <module name="javax.transaction.api"/>
    </dependencies>
</module>
```

Download PostgreSQL JDBC driver and place in same directory.

---

## jBPM Server Installation

### 1. Start jBPM Server

```bash
cd jbpm-server-7.74.1.Final
./bin/standalone.sh

# For Windows:
# bin\standalone.bat
```

### 2. Access Business Central

Open browser and navigate to:
```
http://localhost:8080/business-central
```

**Default Credentials:**
- Username: `admin`
- Password: `admin`

### 3. Configure Users and Roles

Create file: `standalone/configuration/application-users.properties`

```properties
# Risk Management Users
risk-employee=password123
risk-manager=password456
risk-director=password789
```

Create file: `standalone/configuration/application-roles.properties`

```properties
risk-employee=risk-employee,kie-server,rest-all
risk-manager=risk-manager,kie-server,rest-all
risk-director=risk-director,admin,kie-server,rest-all
admin=admin,analyst,kiemgmt,rest-all
```

---

## Project Deployment

### Step 1: Build the Project

```bash
cd liquidity-risk-jbpm
mvn clean install -DskipTests
```

This creates: `target/liquidity-risk-jbpm-2.3.0.jar`

### Step 2: Deploy via Business Central

#### Option A: Manual Import

1. Log in to Business Central
2. Navigate to **Menu → Design → Projects**
3. Click **Import Project**
4. Choose **Upload**
5. Select the built KJAR file
6. Click **Import**

#### Option B: Git Repository

1. Initialize Git repository:
```bash
git init
git add .
git commit -m "Initial commit - Liquidity Risk Indicators V2.3"
```

2. In Business Central:
   - Navigate to **Menu → Design → Projects**
   - Click **Import Project**
   - Choose **Git Repository**
   - Enter repository URL
   - Import project

### Step 3: Build and Deploy

1. In Business Central, open the project
2. Click **Build**
3. Wait for successful build
4. Click **Deploy**
5. Verify deployment in **Menu → Deploy → Execution Servers**

---

## Configuration

### 1. Configure Work Item Handlers

In Business Central:

1. Navigate to **Menu → Settings → Custom Tasks**
2. Add **DataRetrieval** handler:
   - Name: `DataRetrieval`
   - Handler: `com.wahda.liquidity.handler.DataRetrievalWorkItemHandler`
3. Add **ArchiveReport** handler:
   - Name: `ArchiveReport`
   - Handler: `com.wahda.liquidity.handler.ArchiveWorkItemHandler`

### 2. Configure Process Variables

Default values are set in the BPMN process definition, but can be overridden:

```java
Map<String, Object> processVars = new HashMap<>();
processVars.put("report", new LiquidityReport());
processVars.put("selectedYear", 2025);
processVars.put("selectedQuarterRange", "Q1_Q2");
```

### 3. Configure SRS Database Connection

Update `SRSDataRetrievalService.java` with actual database connection:

```java
public BigDecimal retrieveMonthlyValue(String indicatorType, int year, int month) {
    // Configure JDBC connection to SRS Phase 1 database
    String jdbcUrl = "jdbc:postgresql://srs-server:5432/srsdb";
    String query = "SELECT ratio_value FROM regulatory_reports " +
                   "WHERE indicator_type = ? AND report_year = ? " +
                   "AND report_month = ? AND status = 'APPROVED'";

    try (Connection conn = DriverManager.getConnection(jdbcUrl, user, pass);
         PreparedStatement stmt = conn.prepareStatement(query)) {
        stmt.setString(1, indicatorType);
        stmt.setInt(2, year);
        stmt.setInt(3, month);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getBigDecimal("ratio_value");
        }
    }
    return null;
}
```

### 4. Configure Email Notifications (Optional)

In `standalone.xml`, add mail configuration:

```xml
<mail-session name="default" jndi-name="java:jboss/mail/Default">
    <smtp-server outbound-socket-binding-ref="mail-smtp" ssl="true" username="noreply@wahda.bank" password="yourpassword"/>
</mail-session>
```

---

## Testing Deployment

### 1. Verify Server Status

```bash
# Check if server is running
curl http://localhost:8080/kie-server/services/rest/server

# Expected output: Server information JSON
```

### 2. Start a Test Process Instance

```bash
curl -X POST \
  http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/processes/LiquidityRiskIndicators/instances \
  -H 'Authorization: Basic YWRtaW46YWRtaW4=' \
  -H 'Content-Type: application/json' \
  -d '{
    "report": {
        "employeeId": "EMP001",
        "managerId": "MGR001",
        "directorId": "DIR001"
    }
}'
```

### 3. Check Process Instance

```bash
curl -X GET \
  http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/processes/instances/{processInstanceId} \
  -H 'Authorization: Basic YWRtaW46YWRtaW4='
```

### 4. Access Forms

Navigate to Business Central:
```
http://localhost:8080/business-central
```

Go to **Menu → Track → Task Inbox** to see available tasks.

---

## Troubleshooting

### Issue: Server won't start

**Solution:**
```bash
# Check if port 8080 is already in use
netstat -an | grep 8080

# Kill existing process
kill -9 <PID>

# Or change port in standalone.xml
```

### Issue: Database connection fails

**Solution:**
```bash
# Verify PostgreSQL is running
sudo systemctl status postgresql

# Test connection
psql -h localhost -U liquidityuser -d liquiditydb

# Check datasource in server log
tail -f standalone/log/server.log | grep datasource
```

### Issue: Process deployment fails

**Solution:**
```bash
# Check for compilation errors
mvn clean install

# Verify kmodule.xml is correct
cat src/main/resources/META-INF/kmodule.xml

# Check server logs
tail -f standalone/log/server.log
```

### Issue: Forms not displaying

**Solution:**
1. Verify form files are in `src/main/resources/forms/`
2. Check form definitions are valid JSON
3. Rebuild and redeploy project
4. Clear browser cache

### Issue: Work Item Handlers not found

**Solution:**
1. Verify handlers are registered in `kie-deployment-descriptor.xml`
2. Check handler classes are in KJAR
3. Restart KIE Server
4. Check server logs for ClassNotFoundException

---

## Production Deployment Checklist

- [ ] Database backup configured
- [ ] SSL/TLS certificates installed
- [ ] Firewall rules configured
- [ ] User accounts created with proper roles
- [ ] Email notifications configured
- [ ] Monitoring and logging enabled
- [ ] Load testing completed
- [ ] Disaster recovery plan in place
- [ ] Documentation provided to ops team
- [ ] SRS database connection configured
- [ ] Archive storage configured
- [ ] Backup schedule established

---

## Performance Tuning

### JVM Options

Add to `standalone.conf`:

```bash
JAVA_OPTS="$JAVA_OPTS -Xms4g -Xmx8g"
JAVA_OPTS="$JAVA_OPTS -XX:MetaspaceSize=512m -XX:MaxMetaspaceSize=1024m"
JAVA_OPTS="$JAVA_OPTS -XX:+UseG1GC"
```

### Database Connection Pool

In datasource configuration:

```xml
<pool>
    <min-pool-size>10</min-pool-size>
    <max-pool-size>50</max-pool-size>
    <prefill>true</prefill>
</pool>
```

---

## Support

For deployment issues, contact:
- **IT Support**: itsupport@wahda.bank
- **Risk Management**: riskmanagement@wahda.bank
- **Project Lead**: Mohamed ALKOLES

---

**Last Updated**: December 2025
**Version**: 2.3.0
