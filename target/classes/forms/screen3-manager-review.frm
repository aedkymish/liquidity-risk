{
  "id": "screen3-manager-review",
  "name": "Screen 3: Liquidity Risk Review - Manager Assessment",
  "model": {
    "className": "com.wahda.liquidity.model.LiquidityReport",
    "name": "report",
    "properties": [
      {
        "name": "managerComment",
        "typeInfo": {
          "type": "BASE",
          "className": "java.lang.String",
          "multiple": false
        }
      },
      {
        "name": "managerDecision",
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
      "label": "Liquidity Risk Review – Manager Assessment",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<h2>Liquidity Risk Review – Manager Assessment</h2><h3 dir='rtl'>مراجعة مخاطر السيولة - تقييم المدير</h3><p><strong>Report ID:</strong> #{report.reportId} | <strong>Period:</strong> #{report.selectedYear} - #{report.selectedQuarterRange}</p><p><strong>Employee:</strong> #{report.employeeName} | <strong>Submitted:</strong> #{report.submittedToManagerDate}</p>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "id": "field_indicators_table_readonly",
      "name": "field_indicators_table_readonly",
      "label": "Liquidity Indicators (View Only)",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='panel panel-primary'><div class='panel-heading'><h4>Liquidity Indicators Table - View Only</h4></div><div class='panel-body'><div class='table-responsive'><table class='table table-bordered table-hover'><thead class='bg-primary'><tr><th>Financial Indicator<br/><span dir='rtl'>المؤشر المالي</span></th><th>Q1 Result<br/><span dir='rtl'>نتيجة الربع الأول</span></th><th>Q2 Result<br/><span dir='rtl'>نتيجة الربع الثاني</span></th><th>Absolute Coverage<br/><span dir='rtl'>التغطية المطلقة</span></th></tr></thead><tbody><tr><td><strong>Liquidity Coverage Ratio (LCR)</strong></td><td class='text-right'>#{report.lcrIndicator.q1Result}</td><td class='text-right'>#{report.lcrIndicator.q2Result}</td><td class='text-right'>#{report.lcrIndicator.absoluteCoverage}</td></tr><tr><td><strong>Net Stable Funding Ratio (NSFR)</strong></td><td class='text-right'>#{report.nsfrIndicator.q1Result}</td><td class='text-right'>#{report.nsfrIndicator.q2Result}</td><td class='text-right'>#{report.nsfrIndicator.absoluteCoverage}</td></tr><tr><td><strong>Leverage Ratio</strong></td><td class='text-right'>#{report.leverageRatioIndicator.q1Result}</td><td class='text-right'>#{report.leverageRatioIndicator.q2Result}</td><td class='text-right'>#{report.leverageRatioIndicator.absoluteCoverage}</td></tr></tbody></table></div></div></div>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "id": "field_employee_comment_readonly",
      "name": "field_employee_comment_readonly",
      "label": "Employee Comment (View Only)",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='panel panel-info'><div class='panel-heading'><strong>Employee Comment:</strong></div><div class='panel-body'><p>#{report.employeeComment != null ? report.employeeComment : '<em>No comment provided</em>'}</p></div></div>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "nestedForm": "",
      "container": "FIELD_SET",
      "id": "field_managerComment",
      "name": "managerComment",
      "label": "Manager Comment (Optional)",
      "labelAr": "تعليق المدير (اختياري)",
      "required": false,
      "readOnly": false,
      "validateOnChange": false,
      "helpMessage": "Add your review comments or remarks. This field becomes MANDATORY if you choose to return the report to employee.",
      "helpMessageAr": "أضف تعليقات أو ملاحظات المراجعة الخاصة بك. يصبح هذا الحقل إلزاميا إذا اخترت إرجاع التقرير للموظف",
      "binding": "managerComment",
      "standaloneClassName": "java.lang.String",
      "maxLength": 2000,
      "rows": 4,
      "placeholder": "Enter your comment here...",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "nestedForm": "",
      "container": "FIELD_SET",
      "id": "field_managerDecision",
      "name": "managerDecision",
      "label": "Decision",
      "labelAr": "القرار",
      "required": true,
      "readOnly": false,
      "validateOnChange": true,
      "helpMessage": "Select your decision: Submit to Director or Return to Employee",
      "helpMessageAr": "اختر قرارك: إرسال للمدير التنفيذي أو إرجاع للموظف",
      "binding": "managerDecision",
      "standaloneClassName": "java.lang.String",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.selectors.listBox.definition.StringListBoxFieldDefinition",
      "listOfValues": [
        {
          "value": "SUBMIT",
          "text": "Submit to Risk Management Director"
        },
        {
          "value": "RETURN",
          "text": "Return to Employee"
        }
      ],
      "defaultValue": "SUBMIT",
      "addEmptyOption": false
    },
    {
      "id": "field_actions_info",
      "name": "field_actions_info",
      "label": "Instructions",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='alert alert-warning'><strong>Important:</strong><ul><li><strong>Submit:</strong> Approve and send to Director of Risk Management for final approval</li><li><strong>Return to Employee:</strong> Requires a mandatory comment explaining the reason for return</li><li><strong>Download:</strong> Download the report for offline review</li></ul><strong dir='rtl'>مهم:</strong><ul dir='rtl'><li><strong>إرسال:</strong> الموافقة والإرسال لمدير إدارة المخاطر للموافقة النهائية</li><li><strong>إرجاع للموظف:</strong> يتطلب تعليق إلزامي يشرح سبب الإرجاع</li><li><strong>تحميل:</strong> تحميل التقرير للمراجعة في وضع عدم الاتصال</li></ul></div>",
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
                  "form_id": "screen3-manager-review"
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
                  "field_id": "field_indicators_table_readonly",
                  "form_id": "screen3-manager-review"
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
                  "field_id": "field_employee_comment_readonly",
                  "form_id": "screen3-manager-review"
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
                  "field_id": "field_managerComment",
                  "form_id": "screen3-manager-review"
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
            "span": "6",
            "height": "12",
            "rows": [],
            "layoutComponents": [
              {
                "dragTypeName": "org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent",
                "properties": {
                  "field_id": "field_managerDecision",
                  "form_id": "screen3-manager-review"
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
                  "form_id": "screen3-manager-review"
                }
              }
            ]
          }
        ]
      }
    ]
  }
}
