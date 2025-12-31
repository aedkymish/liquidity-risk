# استكشاف أخطاء Business Central وحلها
# Business Central Troubleshooting Guide

---

## 🔴 الأخطاء الحالية / Current Errors

```
❌ Unable to read deployment descriptor from xml
❌ [KBase: liquidityRiskKBase]: unable to parse xml
❌ Build: FAILURE
```

---

## 🔍 التشخيص / Diagnosis

### المشكلة الأساسية:
**Business Central لم يقم بتحديث الملفات من Git**

أو

**Business Central يستخدم cache قديم للمشروع**

---

## ✅ الحل الكامل / Complete Solution

### الحل 1: إعادة استيراد المشروع (موصى به)

#### الخطوة 1: احذف المشروع من Business Central
```
1. افتح Business Central
2. اذهب إلى: Projects
3. ابحث عن: "Liquidity Risk Indicators - jBPM Process"
4. اضغط على (⋮) → Delete Project
5. تأكيد الحذف
```

#### الخطوة 2: أعد استيراد المشروع
```
1. في الصفحة الرئيسية، اضغط: Import Project
2. اختر: Git Repository
3. أدخل URL المشروع:
   [URL الخاص بـ Git repository]
4. اضغط: Import
5. انتظر حتى ينتهي الاستيراد
```

#### الخطوة 3: ابنِ المشروع
```
1. افتح المشروع
2. اضغط: Build & Deploy
3. انتظر النتيجة
```

---

### الحل 2: تنظيف Cache و إعادة البناء

#### الخطوة 1: نظف المشروع
```
1. افتح المشروع في Business Central
2. اذهب إلى: Settings → Build & Deploy
3. اضغط: Clean
4. انتظر حتى ينتهي التنظيف
```

#### الخطوة 2: Pull من Git
```
1. اذهب إلى: Settings → Repository
2. اختر: Remote
3. اضغط: Pull
4. تأكد من رسالة النجاح
```

#### الخطوة 3: أعد البناء
```
1. ارجع إلى صفحة المشروع
2. اضغط: Build & Deploy
3. راقب سجل البناء
```

---

### الحل 3: استخدام التكوين البسيط (Minimal Config)

إذا استمرت المشكلة، جرب التكوين البسيط:

#### الخطوة 1: نسخ الملف البسيط
```bash
# في مجلد المشروع على جهازك
cd src/main/resources/META-INF/

# انسخ الملف البسيط
cp kie-deployment-descriptor-MINIMAL.xml kie-deployment-descriptor.xml
```

#### الخطوة 2: Commit و Push
```bash
git add src/main/resources/META-INF/kie-deployment-descriptor.xml
git commit -m "Use minimal deployment descriptor"
git push
```

#### الخطوة 3: في Business Central
```
1. Pull من Git
2. Clean
3. Build & Deploy
```

---

## 🔧 حلول إضافية / Additional Solutions

### الحل 4: تحقق من صلاحيات المستخدم

```
1. تأكد أن المستخدم "hossam" لديه صلاحيات:
   - admin
   - developer
   - kie-server

2. في Business Central:
   Settings → Roles → [username] → تحقق من الصلاحيات
```

---

### الحل 5: أعد تشغيل Business Central

```bash
# أعد تشغيل الخادم
systemctl restart jbpm-server
# أو
./standalone.sh --server-config=standalone-full.xml
```

---

### الحل 6: تحقق من الـ Dependencies

تأكد أن jBPM Server يحتوي على:

```
✅ jBPM 7.74.1.Final
✅ KIE Server 7.74.1.Final
✅ Java 8 أو Java 11
✅ Maven 3.6+
```

---

## 📝 ملفات التكوين المتوفرة

لديك الآن ملفين للتكوين:

### 1. التكوين الكامل (الحالي):
```
src/main/resources/META-INF/kie-deployment-descriptor.xml
```
- يحتوي على Work Item Handlers
- يحتوي على Required Roles
- يحتوي على Remoteable Classes

### 2. التكوين البسيط (للاختبار):
```
src/main/resources/META-INF/kie-deployment-descriptor-MINIMAL.xml
```
- بدون Work Item Handlers
- بدون Required Roles
- بدون Remoteable Classes

---

## 🎯 اختبار بسيط

### للتأكد أن المشكلة من Business Central وليس من المشروع:

#### اختبار 1: بناء محلي
```bash
# على جهازك
cd /path/to/project
mvn clean install -DskipTests

# إذا نجح البناء المحلي، المشكلة من Business Central
```

#### اختبار 2: التحقق من XML
```bash
# تحقق من صحة XML
xmllint --noout src/main/resources/META-INF/kie-deployment-descriptor.xml
xmllint --noout src/main/resources/processes/liquidity-risk-indicators.bpmn

# إذا لم تظهر أخطاء، الملفات صحيحة
```

---

## 📊 جدول استكشاف الأخطاء

| الخطأ | السبب المحتمل | الحل |
|------|---------------|------|
| Unable to read deployment descriptor | Cache قديم | Clean + Pull + Rebuild |
| Unable to parse BPMN | Cache قديم | إعادة استيراد المشروع |
| Build FAILURE | ملفات قديمة في Business Central | حذف + إعادة استيراد |
| Class not found | target/ في Git | تأكد من .gitignore |

---

## ⚡ الحل السريع (Quick Fix)

**إذا كنت في عجلة من أمرك:**

```
1. احذف المشروع من Business Central
2. أعد استيراده من Git
3. Build & Deploy
```

**هذا يحل 90% من المشاكل!**

---

## 🔄 سير العمل الموصى به

### للتطوير اليومي:

```
[على جهازك]
1. عدّل الكود
2. git commit
3. git push

[في Business Central]
4. Settings → Repository → Pull
5. Clean (اختياري)
6. Build & Deploy
```

---

## 📞 إذا استمرت المشكلة

### تحقق من سجلات Business Central:

```bash
# سجل الخادم
tail -f /path/to/jbpm/standalone/log/server.log

# ابحث عن:
grep "ERROR" server.log | tail -20
grep "Exception" server.log | tail -20
```

### معلومات مفيدة للدعم الفني:

```
- jBPM Version: 7.74.1.Final
- Java Version: [java -version]
- Maven Version: [mvn -version]
- Project Version: 2.3.0
- Error Messages: [انسخها من Business Central]
```

---

## ✅ قائمة التحقق النهائية

قبل البناء في Business Central، تأكد من:

- [ ] ملف .gitignore موجود ويحتوي على target/
- [ ] لا يوجد مجلد target/ في Git
- [ ] ملف pom.xml يحتوي على packaging=kjar
- [ ] ملف kie-deployment-descriptor.xml صحيح
- [ ] تم عمل git push لآخر التغييرات
- [ ] تم عمل Pull في Business Central
- [ ] تم عمل Clean قبل Build

---

## 🎯 النتيجة المتوقعة بعد الحل

```
✅ Deployment descriptor loaded successfully
✅ BPMN process parsed successfully
✅ All Java classes compiled
✅ KJAR created successfully
✅ Build: SUCCESS
✅ Deployed to KIE Server
```

---

## 📚 ملفات مرجعية

- `BUSINESS_CENTRAL_FIXES.md` - الإصلاحات المطبقة
- `BUILD_REPORT.md` - تقرير البناء الشامل
- `JAVA8_MIGRATION.md` - دليل Java 8
- `QUICK_FIX_SUMMARY.md` - ملخص سريع

---

**💡 نصيحة:** إذا كنت تواجه مشاكل متكررة، استخدم التكوين البسيط (MINIMAL) أولاً للتأكد أن المشروع يُبنى، ثم أضف التكوينات المتقدمة تدريجياً.

**🎉 حظ سعيد!**
