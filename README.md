## Ansbile keywords/commands

If the command written inside the block feature fails, then the execution reaches rescue block and it gets executed. In case there is no error in the command under block feature, then rescue will not be executed.

Here, Block is similar to try block where you write the code to be executed and rescue is similar to catch block and always is similar to finally.

- block
- rescue: used for exception handling
- always: gets executed in all cases
- register
- with_items: used for loops
- shell: you can execute a command and register its output to a variable
- when: used for conditionals
- debug
- msg
- pre_tasks
- post_tasks

## Others
roles
tags
verbosity with -v or --v

### task
1. Use ansible to configure a vagrant box instance
2. Use ansible to configure a remote EC2 instance
3. Use ansible to configure a list of EC2 instance without hardcodingthe hosts informatiom
