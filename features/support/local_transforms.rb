ParameterType(
    name: 'runtime name',
    regexp: /A Unique Name/,
    transformer: -> (name){ "Automation test" + Time.now.to_s}
)

ParameterType(
    name: 'runtime content',
    regexp: /A Unique Sentence/,
    transformer: -> (content){ "Automation test " + Time.now.to_s + ". To edit the field."}
)

ParameterType(
    name: 'toggle',
    regexp: /Attendance Complete/,
    transformer: -> (toggle_yes_no){ 'yes'}
)