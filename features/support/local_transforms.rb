# Explaination for the use of Cucumber transformer:
# The regex is the Gherkin syntax in the Feature file, name is the technical term and the transformer is the actual value used in the runtime

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