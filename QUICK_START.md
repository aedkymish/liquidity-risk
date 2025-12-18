# 🚀 Quick Start Guide - Liquidity Risk Indicators

Get up and running with the Liquidity Risk Indicators jBPM process in minutes!

---

## ⚡ Prerequisites Checklist

- [ ] Java 11+ installed
- [ ] Maven 3.6+ installed
- [ ] jBPM Server 7.74+ downloaded and extracted
- [ ] PostgreSQL or MySQL database running
- [ ] 10 minutes of your time

---

## 📦 Step 1: Build the Project (2 minutes)

```bash
# Navigate to project directory
cd liquidity-risk-jbpm

# Build the KJAR
mvn clean install -DskipTests

# ✅ Success! You should see:
# BUILD SUCCESS
# Target KJAR: target/liquidity-risk-jbpm-2.3.0.jar
```

---

## 🗄️ Step 2: Setup Database (3 minutes)

### PostgreSQL:

```bash
# Connect to PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE liquiditydb;
CREATE USER liquidityuser WITH PASSWORD 'yourpassword';
GRANT ALL PRIVILEGES ON DATABASE liquiditydb TO liquidityuser;
\q
```

### MySQL:

```bash
# Connect to MySQL
mysql -u root -p

# Create database
CREATE DATABASE liquiditydb;
CREATE USER 'liquidityuser'@'localhost' IDENTIFIED BY 'yourpassword';
GRANT ALL PRIVILEGES ON liquiditydb.* TO 'liquidityuser'@'localhost';
FLUSH PRIVILEGES;
exit;
```

---

## 🚀 Step 3: Start jBPM Server (1 minute)

```bash
# Navigate to jBPM server directory
cd /path/to/jbpm-server-7.74.1.Final

# Start the server
./bin/standalone.sh

# For Windows:
# bin\standalone.bat

# ✅ Wait for: "Started in XXXXms"
```

---

## 🌐 Step 4: Access Business Central (1 minute)

1. Open browser: `http://localhost:8080/business-central`
2. Login with:
   - **Username**: `admin`
   - **Password**: `admin`
3. ✅ You should see the Business Central dashboard

---

## 📤 Step 5: Deploy the Process (2 minutes)

### Option A: Manual Upload (Easiest)

1. In Business Central, click **Menu → Design → Projects**
2. Click **Import Project** button
3. Select **Upload** tab
4. Choose file: `target/liquidity-risk-jbpm-2.3.0.jar`
5. Click **Ok** to import
6. Once imported, click **Build** button
7. After successful build, click **Deploy**
8. ✅ Process deployed!

### Option B: Maven Deploy (Advanced)

```bash
# Configure settings.xml with KIE Server details
mvn deploy -DskipTests
```

---

## ▶️ Step 6: Start Your First Process (1 minute)

### Via Business Central UI:

1. Click **Menu → Manage → Process Definitions**
2. Find **Liquidity Risk Indicators**
3. Click **Start** button
4. Fill in:
   - Employee ID: `EMP001`
   - Manager ID: `MGR001`
   - Director ID: `DIR001`
5. Click **Submit**
6. ✅ Process started!

### Via REST API:

```bash
curl -X POST \
  'http://localhost:8080/kie-server/services/rest/server/containers/liquidity-risk-jbpm_2.3.0/processes/LiquidityRiskIndicators/instances' \
  -u 'admin:admin' \
  -H 'Content-Type: application/json' \
  -d '{
    "report": {
      "employeeId": "EMP001",
      "managerId": "MGR001",
      "directorId": "DIR001"
    }
  }'
```

---

## ✅ Step 7: Complete Your First Task

1. Click **Menu → Track → Task Inbox**
2. You should see: **"Screen 1: Period Selection"**
3. Click **Claim** to assign it to yourself
4. Click **Start** to begin
5. Fill the form:
   - **Year**: Select `2025`
   - **Quarter Range**: Select `Q1 – Q2`
6. Click **Complete**
7. ✅ First task completed!

---

## 🎯 Next Steps

Now that you've completed the basic setup, you can:

### View the Process:
- **Menu → Manage → Process Instances**
- Find your running process
- Click to see process diagram and variables

### Complete the Workflow:
1. **Screen 2** (Employee): Add comment, Submit
2. **Screen 3** (Manager): Review, Approve or Return
3. **Screen 4** (Director): Final approval

### Explore the API:
- Check out `docs/API_GUIDE.md` for REST API examples
- Test endpoints with Postman or curl

### Configure for Production:
- Review `docs/DEPLOYMENT_GUIDE.md`
- Connect to real SRS Phase 1 database
- Set up proper user accounts

---

## 🔧 Quick Troubleshooting

### Server won't start?
```bash
# Check if port 8080 is in use
netstat -an | grep 8080
# Kill the process using the port
kill -9 <PID>
```

### Can't login?
- Default credentials: `admin` / `admin`
- Check `application-users.properties` file

### Process won't deploy?
```bash
# Check for build errors
mvn clean install
# Review build output for errors
```

### Task not showing in inbox?
- Verify user has correct role
- Check process instance is active
- Refresh the task inbox

---

## 📊 Sample Test Data

### Test Users (Create these in Business Central):

| Username | Password | Role | Screen Access |
|----------|----------|------|---------------|
| emp001 | password123 | risk-employee | Screens 1, 2 |
| mgr001 | password456 | risk-manager | Screen 3 |
| dir001 | password789 | risk-director | Screen 4 |

### Test Process Data:

**Period**: Year 2025, Q1-Q2

**Expected Flow**:
```
1. EMP001 selects period → Submits
2. System retrieves data from SRS
3. EMP001 reviews indicators → Submits to Manager
4. MGR001 reviews → Approves
5. DIR001 final approval → Archives
6. ✅ Process Complete!
```

---

## 📚 Documentation Links

- **Full README**: `README.md`
- **Deployment Guide**: `docs/DEPLOYMENT_GUIDE.md`
- **API Reference**: `docs/API_GUIDE.md`
- **Project Summary**: `PROJECT_SUMMARY.md`

---

## 🆘 Getting Help

### Common Issues:

**"Data Not Found" error?**
- The system tries to retrieve data from SRS Phase 1
- Currently using placeholder - implement `SRSDataRetrievalService`
- For testing, add mock data or skip validation

**Forms not loading?**
- Ensure forms are deployed with the process
- Check browser console for errors
- Try clearing browser cache

**Tasks not appearing?**
- Verify correct user/role assignment
- Check process instance is active
- Use Process Instance view to debug

---

## ✨ Success Indicators

You'll know everything is working when:

✅ Server starts without errors
✅ Business Central loads successfully
✅ Process deploys successfully
✅ You can start a process instance
✅ Tasks appear in inbox
✅ Forms display correctly
✅ You can complete a full workflow

---

## 🎓 Learning Path

### Day 1: Setup & Basics
- ✅ You are here! Complete this quick start
- Explore Business Central interface
- Start and complete one process

### Day 2: Configuration
- Review deployment guide
- Configure database properly
- Set up user accounts

### Day 3: Integration
- Connect to SRS database
- Test data retrieval
- Verify calculations

### Day 4: Testing
- Run through all test cases
- Test return scenarios
- Verify archiving

### Day 5: Production Ready
- Performance testing
- Security review
- Go-live preparation

---

## 💡 Pro Tips

1. **Start Simple**: Use the default admin user for initial testing
2. **Use Browser DevTools**: Check console for any JavaScript errors
3. **Monitor Logs**: Keep an eye on `server.log` for errors
4. **Test Incrementally**: Complete one screen at a time
5. **Document Issues**: Keep notes of any problems encountered

---

## 🎉 You're Ready!

Congratulations! You've successfully set up and tested the Liquidity Risk Indicators jBPM process.

**What you've accomplished:**
- ✅ Built the KJAR package
- ✅ Set up the database
- ✅ Started jBPM server
- ✅ Deployed the process
- ✅ Started your first process instance
- ✅ Completed your first task

**Next Actions:**
1. Complete a full workflow end-to-end
2. Test with different users and roles
3. Review the full documentation
4. Configure for your environment
5. Start using in production!

---

**Need More Help?**
- 📖 Read the full README.md
- 📘 Check the Deployment Guide
- 📗 Review the API Guide
- 📙 See the Project Summary

**Happy Processing! 🚀**

---

**Created for Al Wahda Bank - Risk Management Department**
**Version 2.3.0 | December 2025**
