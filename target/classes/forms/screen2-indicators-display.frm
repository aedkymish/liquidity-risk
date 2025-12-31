{
  "id": "screen2-indicators-display",
  "name": "Screen 2: Liquidity Risk Indicators - Quarterly Overview",
  "model": {
    "className": "com.wahda.liquidity.model.LiquidityReport",
    "name": "report",
    "properties": [
      {
        "name": "lcrIndicator",
        "typeInfo": {
          "type": "OBJECT",
          "className": "com.wahda.liquidity.model.LiquidityIndicator",
          "multiple": false
        }
      },
      {
        "name": "nsfrIndicator",
        "typeInfo": {
          "type": "OBJECT",
          "className": "com.wahda.liquidity.model.LiquidityIndicator",
          "multiple": false
        }
      },
      {
        "name": "leverageRatioIndicator",
        "typeInfo": {
          "type": "OBJECT",
          "className": "com.wahda.liquidity.model.LiquidityIndicator",
          "multiple": false
        }
      },
      {
        "name": "employeeComment",
        "typeInfo": {
          "type": "BASE",
          "className": "java.lang.String",
          "multiple": false
        }
      }
    ],
    "formModelType": "org.kie.workbench.common.forms.data.modeller.model.DataObjectFormModel"
  },
  "fields": [
    {
      "id": "field_header",
      "name": "field_header",
      "label": "Liquidity Risk Indicators – Quarterly Overview",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<h2>Liquidity Risk Indicators – Quarterly Overview</h2><h3 dir='rtl'>مؤشرات مخاطر السيولة - نظرة عامة ربع سنوية</h3><p><strong>Period:</strong> #{report.selectedYear} - #{report.selectedQuarterRange}</p>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "id": "field_indicators_table",
      "name": "field_indicators_table",
      "label": "Liquidity Indicators Table",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='table-responsive'><table class='table table-bordered table-striped'><thead><tr><th>Financial Indicator<br/><span dir='rtl'>المؤشر المالي</span></th><th>Q1 Result<br/><span dir='rtl'>نتيجة الربع الأول</span></th><th>Q2 Result<br/><span dir='rtl'>نتيجة الربع الثاني</span></th><th>Absolute Coverage<br/><span dir='rtl'>التغطية المطلقة</span></th></tr></thead><tbody><tr><td><strong>Liquidity Coverage Ratio (LCR)</strong><br/><span dir='rtl'>نسبة تغطية السيولة</span></td><td class='text-right'><strong>#{report.lcrIndicator.q1Result}</strong></td><td class='text-right'><strong>#{report.lcrIndicator.q2Result}</strong></td><td class='text-right'><strong>#{report.lcrIndicator.absoluteCoverage}</strong></td></tr><tr><td><strong>Net Stable Funding Ratio (NSFR)</strong><br/><span dir='rtl'>نسبة التمويل المستقر الصافي</span></td><td class='text-right'><strong>#{report.nsfrIndicator.q1Result}</strong></td><td class='text-right'><strong>#{report.nsfrIndicator.q2Result}</strong></td><td class='text-right'><strong>#{report.nsfrIndicator.absoluteCoverage}</strong></td></tr><tr><td><strong>Leverage Ratio</strong><br/><span dir='rtl'>نسبة الرافعة المالية</span></td><td class='text-right'><strong>#{report.leverageRatioIndicator.q1Result}</strong></td><td class='text-right'><strong>#{report.leverageRatioIndicator.q2Result}</strong></td><td class='text-right'><strong>#{report.leverageRatioIndicator.absoluteCoverage}</strong></td></tr></tbody></table></div><div class='alert alert-warning'><strong>Note:</strong> All values are system-generated from SRS Phase 1 - Central Bank of Libya Requirements and are view-only.<br/><strong dir='rtl'>ملاحظة:</strong> <span dir='rtl'>جميع القيم تم توليدها تلقائياً من نظام SRS المرحلة الأولى - متطلبات البنك المركزي الليبي وهي للقراءة فقط</span></div>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "nestedForm": "",
      "container": "FIELD_SET",
      "id": "field_employeeComment",
      "name": "employeeComment",
      "label": "Employee Comment (Optional)",
      "labelAr": "تعليق الموظف (اختياري)",
      "required": false,
      "readOnly": false,
      "validateOnChange": false,
      "helpMessage": "Add your explanation or justification related to the liquidity indicators shown in the table",
      "helpMessageAr": "أضف تفسيرك أو مبررك المتعلق بمؤشرات السيولة الموضحة في الجدول",
      "binding": "employeeComment",
      "standaloneClassName": "java.lang.String",
      "maxLength": 2000,
      "rows": 5,
      "placeholder": "Enter your comment here...",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "id": "field_actions_info",
      "name": "field_actions_info",
      "label": "Actions",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='alert alert-info'><strong>Available Actions:</strong><ul><li><strong>Save:</strong> Save as draft without submitting</li><li><strong>Submit:</strong> Submit to Direct Manager for review</li></ul><strong dir='rtl'>الإجراءات المتاحة:</strong><ul dir='rtl'><li><strong>حفظ:</strong> حفظ كمسودة دون إرسال</li><li><strong>إرسال:</strong> إرسال للمدير المباشر للمراجعة</li></ul></div>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    }
  ],
  "layoutTemplate": {
    "version": 2,
    "style": "FLUID",
    "layoutProperties": {},
    "rows": [
      {
        "height": "12",
        "layoutColumns": [
          {
            "span": "12",
            "height": "12",
            "rows": [],
            "layoutComponents": [
              {
                "dragTypeName": "org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent",
                "properties": {
                  "field_id": "field_header",
                  "form_id": "screen2-indicators-display"
                }
              }
            ]
          }
        ]
      },
      {
        "height": "12",
        "layoutColumns": [
          {
            "span": "12",
            "height": "12",
            "rows": [],
            "layoutComponents": [
              {
                "dragTypeName": "org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent",
                "properties": {
                  "field_id": "field_indicators_table",
                  "form_id": "screen2-indicators-display"
                }
              }
            ]
          }
        ]
      },
      {
        "height": "12",
        "layoutColumns": [
          {
            "span": "12",
            "height": "12",
            "rows": [],
            "layoutComponents": [
              {
                "dragTypeName": "org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent",
                "properties": {
                  "field_id": "field_employeeComment",
                  "form_id": "screen2-indicators-display"
                }
              }
            ]
          }
        ]
      },
      {
        "height": "12",
        "layoutColumns": [
          {
            "span": "12",
            "height": "12",
            "rows": [],
            "layoutComponents": [
              {
                "dragTypeName": "org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent",
                "properties": {
                  "field_id": "field_actions_info",
                  "form_id": "screen2-indicators-display"
                }
              }
            ]
          }
        ]
      }
    ]
  }
}
