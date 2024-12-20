{
  "$GMRoom":"v1",
  "%Name":"demo_JsonUtilities",
  "creationCodeFile":"",
  "inheritCode":false,
  "inheritCreationOrder":false,
  "inheritLayers":false,
  "instanceCreationOrder":[
    {"name":"inst_1CF29529_2_1","path":"rooms/demo_JsonUtilities/demo_JsonUtilities.yy",},
    {"name":"inst_64A8379C_1","path":"rooms/demo_JsonUtilities/demo_JsonUtilities.yy",},
    {"name":"ui_JsonFileText","path":"rooms/demo_JsonUtilities/demo_JsonUtilities.yy",},
    {"name":"inst_AEC7EB7","path":"rooms/demo_JsonUtilities/demo_JsonUtilities.yy",},
    {"name":"inst_264342A1","path":"rooms/demo_JsonUtilities/demo_JsonUtilities.yy",},
    {"name":"inst_392D2D5D","path":"rooms/demo_JsonUtilities/demo_JsonUtilities.yy",},
    {"name":"inst_14774539","path":"rooms/demo_JsonUtilities/demo_JsonUtilities.yy",},
    {"name":"inst_5CD4DFF0","path":"rooms/demo_JsonUtilities/demo_JsonUtilities.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMRInstanceLayer":"","%Name":"Instances","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_1CF29529_2_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_1CF29529_2_1","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":5.0,"scaleY":1.0,"x":1088.0,"y":32.0,},
        {"$GMRInstance":"v1","%Name":"inst_64A8379C_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_64A8379C_1","objectId":{"name":"ctrl_JsonUtilities","path":"objects/ctrl_JsonUtilities/ctrl_JsonUtilities.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
        {"$GMRInstance":"v1","%Name":"ui_JsonFileText","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"ui_JsonFileText","objectId":{"name":"ui_TextArea","path":"objects/ui_TextArea/ui_TextArea.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_TextArea","path":"objects/ui_TextArea/ui_TextArea.yy",},"propertyId":{"name":"text","path":"objects/ui_TextArea/ui_TextArea.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"\"{ \\\"content\\\": \\\"Click on the text area to change the JSON, or save/load its file.\\\" }\"",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":25.0,"scaleY":20.0,"x":256.0,"y":32.0,},
        {"$GMRInstance":"v1","%Name":"inst_AEC7EB7","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_AEC7EB7","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"text","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Load file",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"on_click","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"ctrl_JsonUtilities.load_file",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":6.0,"scaleY":1.0,"x":32.0,"y":32.0,},
        {"$GMRInstance":"v1","%Name":"inst_264342A1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_264342A1","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"text","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Load uppercase",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"on_click","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"ctrl_JsonUtilities.load_file_uppercase",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":6.0,"scaleY":1.0,"x":32.0,"y":96.0,},
        {"$GMRInstance":"v1","%Name":"inst_392D2D5D","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_392D2D5D","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"text","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Save file",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"on_click","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"ctrl_JsonUtilities.save_file",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":6.0,"scaleY":1.0,"x":32.0,"y":224.0,},
        {"$GMRInstance":"v1","%Name":"inst_14774539","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_14774539","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"text","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Save file (pretty)",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"on_click","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"ctrl_JsonUtilities.save_file_pretty",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":6.0,"scaleY":1.0,"x":32.0,"y":288.0,},
        {"$GMRInstance":"v1","%Name":"inst_5CD4DFF0","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_5CD4DFF0","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"text","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Save uppercase",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"ui_Button","path":"objects/ui_Button/ui_Button.yy",},"propertyId":{"name":"on_click","path":"objects/ui_Button/ui_Button.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"ctrl_JsonUtilities.save_file_uppercase",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":6.0,"scaleY":1.0,"x":32.0,"y":352.0,},
      ],"layers":[],"name":"Instances","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "name":"demo_JsonUtilities",
  "parent":{
    "name":"JSON Utilities",
    "path":"folders/Demo/JSON Utilities.yy",
  },
  "parentRoom":null,
  "physicsSettings":{
    "inheritPhysicsSettings":false,
    "PhysicsWorld":false,
    "PhysicsWorldGravityX":0.0,
    "PhysicsWorldGravityY":10.0,
    "PhysicsWorldPixToMetres":0.1,
  },
  "resourceType":"GMRoom",
  "resourceVersion":"2.0",
  "roomSettings":{
    "Height":720,
    "inheritRoomSettings":false,
    "persistent":false,
    "Width":1280,
  },
  "sequenceId":null,
  "views":[
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings":{
    "clearDisplayBuffer":true,
    "clearViewBackground":false,
    "enableViews":false,
    "inheritViewSettings":false,
  },
  "volume":1.0,
}