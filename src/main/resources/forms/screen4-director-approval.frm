{
  "id": "screen4-director-approval",
  "name": "Screen 4: Liquidity Risk Final Approval - Director of Risk Management",
  "model": {
    "className": "com.wahda.liquidity.model.LiquidityReport",
    "name": "report",
    "properties": [
      {
        "name": "directorComment",
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
      "label": "Liquidity Risk Final Approval – Director of Risk Management",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<h2>Liquidity Risk Final Approval – Director of Risk Management</h2><h3 dir='rtl'>الموافقة النهائية على مخاطر السيولة - مدير إدارة المخاطر</h3><p><strong>Report ID:</strong> #{report.reportId} | <strong>Period:</strong> #{report.selectedYear} - #{report.selectedQuarterRange}</p><p><strong>Employee:</strong> #{report.employeeName} | <strong>Manager:</strong> #{report.managerName}</p><p><strong>Submitted to Director:</strong> #{report.submittedToDirectorDate}</p>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "id": "field_indicators_table_readonly",
      "name": "field_indicators_table_readonly",
      "label": "Liquidity Indicators (View Only)",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='panel panel-success'><div class='panel-heading'><h4>Liquidity Indicators Table - View Only</h4></div><div class='panel-body'><div class='table-responsive'><table class='table table-bordered table-hover'><thead class='bg-success'><tr><th>Financial Indicator<br/><span dir='rtl'>المؤشر المالي</span></th><th>Q1 Result<br/><span dir='rtl'>نتيجة الربع الأول</span></th><th>Q2 Result<br/><span dir='rtl'>نتيجة الربع الثاني</span></th><th>Absolute Coverage<br/><span dir='rtl'>التغطية المطلقة</span></th></tr></thead><tbody><tr><td><strong>Liquidity Coverage Ratio (LCR)</strong><br/><span dir='rtl' class='text-muted'>نسبة تغطية السيولة</span></td><td class='text-right'><span class='label label-info'>#{report.lcrIndicator.q1Result}</span></td><td class='text-right'><span class='label label-info'>#{report.lcrIndicator.q2Result}</span></td><td class='text-right'><span class='label label-warning'>#{report.lcrIndicator.absoluteCoverage}</span></td></tr><tr><td><strong>Net Stable Funding Ratio (NSFR)</strong><br/><span dir='rtl' class='text-muted'>نسبة التمويل المستقر الصافي</span></td><td class='text-right'><span class='label label-info'>#{report.nsfrIndicator.q1Result}</span></td><td class='text-right'><span class='label label-info'>#{report.nsfrIndicator.q2Result}</span></td><td class='text-right'><span class='label label-warning'>#{report.nsfrIndicator.absoluteCoverage}</span></td></tr><tr><td><strong>Leverage Ratio</strong><br/><span dir='rtl' class='text-muted'>نسبة الرافعة المالية</span></td><td class='text-right'><span class='label label-info'>#{report.leverageRatioIndicator.q1Result}</span></td><td class='text-right'><span class='label label-info'>#{report.leverageRatioIndicator.q2Result}</span></td><td class='text-right'><span class='label label-warning'>#{report.leverageRatioIndicator.absoluteCoverage}</span></td></tr></tbody></table></div></div></div>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "id": "field_employee_comment_readonly",
      "name": "field_employee_comment_readonly",
      "label": "Employee Comment (View Only)",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='panel panel-default'><div class='panel-heading'><strong><i class='glyphicon glyphicon-user'></i> Employee Comment:</strong></div><div class='panel-body'><p>#{report.employeeComment != null ? report.employeeComment : '<em class=\"text-muted\">No comment provided</em>'}</p></div></div>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "id": "field_manager_comment_readonly",
      "name": "field_manager_comment_readonly",
      "label": "Manager Comment (View Only)",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='panel panel-default'><div class='panel-heading'><strong><i class='glyphicon glyphicon-briefcase'></i> Manager Comment:</strong></div><div class='panel-body'><p>#{report.managerComment != null ? report.managerComment : '<em class=\"text-muted\">No comment provided</em>'}</p></div></div>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "nestedForm": "",
      "container": "FIELD_SET",
      "id": "field_directorComment",
      "name": "directorComment",
      "label": "Director Comment (Optional)",
      "labelAr": "تعليق المدير التنفيذي (اختياري)",
      "required": false,
      "readOnly": false,
      "validateOnChange": false,
      "helpMessage": "Add your final review comments or approval notes",
      "helpMessageAr": "أضف تعليقات المراجعة النهائية أو ملاحظات الموافقة",
      "binding": "directorComment",
      "standaloneClassName": "java.lang.String",
      "maxLength": 2000,
      "rows": 4,
      "placeholder": "Enter your final approval comments here...",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "id": "field_actions_info",
      "name": "field_actions_info",
      "label": "Final Approval Actions",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "code": "<div class='alert alert-danger'><strong><i class='glyphicon glyphicon-exclamation-sign'></i> Important Notice:</strong><ul><li><strong>No Return Option:</strong> At this final approval stage, there is NO option to return the report to the manager or employee</li><li><strong>Submit:</strong> Clicking Submit will approve and archive the report permanently</li><li><strong>Download:</strong> You can download the complete report for your records before approving</li><li>All data is view-only and cannot be modified at this stage</li></ul><strong dir='rtl'><i class='glyphicon glyphicon-exclamation-sign'></i> إشعار هام:</strong><ul dir='rtl'><li><strong>لا يوجد خيار إرجاع:</strong> في مرحلة الموافقة النهائية هذه، لا يوجد خيار لإرجاع التقرير للمدير أو الموظف</li><li><strong>إرسال:</strong> النقر على إرسال سيوافق ويؤرشف التقرير بشكل دائم</li><li><strong>تحميل:</strong> يمكنك تحميل التقرير الكامل لسجلاتك قبل الموافقة</li><li>جميع البيانات للقراءة فقط ولا يمكن تعديلها في هذه المرحلة</li></ul></div><div class='well well-sm text-center'><p><strong>By clicking Submit, you confirm final approval of this Liquidity Risk Report</strong></p><p dir='rtl'><strong>بالنقر على إرسال، فإنك تؤكد الموافقة النهائية على تقرير مخاطر السيولة هذا</strong></p></div>",
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
                  "form_id": "screen4-director-approval"
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
                  "form_id": "screen4-director-approval"
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
                  "field_id": "field_employee_comment_readonly",
                  "form_id": "screen4-director-approval"
                }
              }
            ]
          },
          {
            "span": "6",
            "height": "12",
            "rows": [],
            "layoutComponents": [
              {
                "dragTypeName": "org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent",
                "properties": {
                  "field_id": "field_manager_comment_readonly",
                  "form_id": "screen4-director-approval"
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
                  "field_id": "field_directorComment",
                  "form_id": "screen4-director-approval"
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
                  "form_id": "screen4-director-approval"
                }
              }
            ]
          }
        ]
      }
    ]
  }
}
