function CopilotIcon()
    if CopilotEnable then
        return {
            'copilot',
            symbols = {
                status = {
                    icons = {
                        enabled = "",
                        sleep = "",
                        disabled = "",
                        warning = "",
                        unknown = ""
                    }
                }
            }
        }

    end

    return ""
end

function CopilotCMP()
    if CopilotEnable then
        return {
            name = "copilot",
            group_index = 1,
            priority = 100
        }
    end

    return {}
end
