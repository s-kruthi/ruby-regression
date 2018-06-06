FACE_TO_FACE_SESSION_VALUES = {
    "instruction".downcase => SESSION_INSTRUCTION_TEXT,
    "post-signup".downcase => POST_ACTIVITY_EDITOR_TXT,
    "time_zone".downcase => F2F_SESSION_Time_ZONE_INPUT_VALUE,
    "min_capacity".downcase => F2F_SESSION_MIN_CAPACITY_INPUT_VALUE,
    "If min capacity not met".downcase => F2F_SESSION_MIN_NOT_MET_INPUT_VALUE,
    "max_capacity".downcase => F2F_SESSION_MAX_CAPACITY_INPUT_VALUE,
    "If max capacity exceeds".downcase => F2F_SESSION_MAX_CAPACITY_EXCEED,
    "location".downcase => F2F_SESSION_LOCATION_INPUT_VALUE,
    "facilitator".downcase => F2F_SESSION_FACILITATOR_INPUT_VALUE,
    "availability".downcase => F2F_SESSION_AVAILABILITY_INPUT_VALUE,
    # Capacity and Status value is in page "Session Details" of F2F session
    "capacity".downcase => '0' + "/" + F2F_SESSION_MAX_CAPACITY_INPUT_VALUE,
    "status".downcase => "Upcoming"
}

FACE_TO_FACE_SESSION_EDIT_VALUES = {
    "instruction": SESSION_INSTRUCTION_TEXT,
    "post-signup": POST_ACTIVITY_EDITOR_TXT,
    "time_zone": F2F_SESSION_Time_ZONE_INPUT_VALUE,
    "min_capacity": F2F_SESSION_MIN_CAPACITY_EDIT_VALUE,
    "If min capacity not met": F2F_SESSION_MIN_NOT_MET_INPUT_VALUE,
    "min_not_met": F2F_SESSION_MIN_NOT_MET_INPUT_VALUE,
    "max_capacity": F2F_SESSION_MAX_CAPACITY_EDIT_VALUE,
    "If max capacity exceeds": F2F_SESSION_MAX_CAPACITY_EXCEED,
    "location": F2F_SESSION_LOCATION_EDIT_VALUE,
    "facilitator": F2F_SESSION_FACILITATOR_EDIT_VALUE,
    "availability": F2F_SESSION_AVAILABILITY_EDIT_VALUE,
    "status": "Upcoming"
}