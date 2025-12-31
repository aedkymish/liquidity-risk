{
  "id": "screen1-period-selection",
  "name": "Screen 1: Period Selection - Liquidity Risk Reporting",
  "model": {
    "className": "com.wahda.liquidity.model.LiquidityReport",
    "name": "report",
    "properties": [
      {
        "name": "selectedYear",
        "typeInfo": {
          "type": "BASE",
          "className": "java.lang.Integer",
          "multiple": false
        },
        "metaData": {
          "entries": []
        }
      },
      {
        "name": "selectedQuarterRange",
        "typeInfo": {
          "type": "BASE",
          "className": "java.lang.String",
          "multiple": false
        },
        "metaData": {
          "entries": []
        }
      }
    ],
    "formModelType": "org.kie.workbench.common.forms.data.modeller.model.DataObjectFormModel"
  },
  "fields": [
    {
      "id": "field_header",
      "name": "field_header",
      "label": "Period Selection – Liquidity Risk Reporting",
      "labelAr": "اختيار الفترة - تقرير مخاطر السيولة",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "binding": "",
      "standaloneClassName": "",
      "code": "<h2>Period Selection – Liquidity Risk Reporting</h2><h3 dir='rtl'>اختيار الفترة - تقرير مخاطر السيولة</h3>",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textArea.definition.TextAreaFieldDefinition"
    },
    {
      "nestedForm": "",
      "container": "FIELD_SET",
      "id": "field_selectedYear",
      "name": "selectedYear",
      "label": "Select Year",
      "labelAr": "اختر السنة",
      "required": true,
      "readOnly": false,
      "validateOnChange": true,
      "helpMessage": "Select the reporting year for liquidity indicators",
      "helpMessageAr": "اختر سنة التقرير لمؤشرات السيولة",
      "binding": "selectedYear",
      "standaloneClassName": "java.lang.Integer",
      "code": "",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.selectors.listBox.definition.IntegerListBoxFieldDefinition",
      "options": [],
      "defaultValue": "2025",
      "addEmptyOption": false
    },
    {
      "nestedForm": "",
      "container": "FIELD_SET",
      "id": "field_selectedQuarterRange",
      "name": "selectedQuarterRange",
      "label": "Select Quarter Range",
      "labelAr": "اختر نطاق الأرباع",
      "required": true,
      "readOnly": false,
      "validateOnChange": true,
      "helpMessage": "Select the pair of quarters to be analyzed",
      "helpMessageAr": "اختر زوج الأرباع المراد تحليله",
      "binding": "selectedQuarterRange",
      "standaloneClassName": "java.lang.String",
      "code": "",
      "serializedFieldClassName": "org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.selectors.listBox.definition.StringListBoxFieldDefinition",
      "listOfValues": [
        {
          "value": "Q1_Q2",
          "text": "Q1 – Q2"
        },
        {
          "value": "Q2_Q3",
          "text": "Q2 – Q3"
        },
        {
          "value": "Q3_Q4",
          "text": "Q3 – Q4"
        }
      ],
      "defaultValue": "Q1_Q2",
      "addEmptyOption": false
    },
    {
      "id": "field_instructions",
      "name": "field_instructions",
      "label": "Instructions",
      "required": false,
      "readOnly": true,
      "validateOnChange": false,
      "binding": "",
      "standaloneClassName": "",
      "code": "<div class='alert alert-info'><strong>Instructions:</strong><br/>1. Select the year for which you want to generate the liquidity risk report<br/>2. Select the quarter range to be analyzed<br/>3. Click Submit to proceed to the indicators screen<br/><br/><strong dir='rtl'>تعليمات:</strong><br/><span dir='rtl'>١. اختر السنة التي تريد إنشاء تقرير مخاطر السيولة لها<br/>٢. اختر نطاق الأرباع المراد تحليله<br/>٣. انقر على إرسال للانتقال إلى شاشة المؤشرات</span></div>",
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
                  "form_id": "screen1-period-selection"
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
                  "field_id": "field_selectedYear",
                  "form_id": "screen1-period-selection"
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
                  "field_id": "field_selectedQuarterRange",
                  "form_id": "screen1-period-selection"
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
                  "field_id": "field_instructions",
                  "form_id": "screen1-period-selection"
                }
              }
            ]
          }
        ]
      }
    ]
  }
}
