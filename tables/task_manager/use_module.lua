local taskManager = require("tables/task_manager/task_manager_module")
taskManager.addTask("Study Lua", "Complete exercises", "2024-03-27")
taskManager.addTask("Practice OOP", "Create classes", "2024-03-28")
taskManager.markComplete("Study Lua")
taskManager.listTasks()

print(taskManager.version)

taskManager.listUncompletedTasks()

taskManager.listCompletedTasks()
