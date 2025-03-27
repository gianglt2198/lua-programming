local TaskManager = {
    version = "1.0",
    author = "Author",

    _validateTask = function(title, description, dueDate)
        return type(title) == "string" and type(description) == "string" and type(dueDate) == "string"
    end,

    tasks = {},
}

function TaskManager.addTask(title, description, dueDate)
    if not TaskManager._validateTask(title, description, dueDate) then
        error("Arguments must be strings")
    end

    local task = {
        title = title,
        description = description,
        dueDate = dueDate,
    }

    table.insert(TaskManager.tasks, task)
end

function TaskManager.markComplete(title)
    for _, task in ipairs(TaskManager.tasks) do
        if task.title == title then
            task.completed = true
            return
        end
    end
end

function TaskManager.listTasks()
    for _, task in ipairs(TaskManager.tasks) do
        print(task.title, task.description, task.dueDate)
    end
end

function TaskManager.listCompletedTasks()
    for _, task in ipairs(TaskManager.tasks) do
        if task.completed then
            print(task.title, task.description, task.dueDate)
        end
    end
end

function TaskManager.listUncompletedTasks()
    for _, task in ipairs(TaskManager.tasks) do
        if not task.completed then
            print(task.title, task.description, task.dueDate)
        end
    end
end

return TaskManager
