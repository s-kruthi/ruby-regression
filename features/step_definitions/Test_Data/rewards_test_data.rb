NEW_BADGE_TITLE = "autobadge" + rand(10..100).to_s

img_file_name = "sample.jpg"
FILE_NAME = File.join(File.absolute_path("../../step_definitions/Test_Data/", File.dirname(__FILE__)), img_file_name)

BADGE_SAVE_SUCCESS_VALUE = "Badge data is saved successfully"
