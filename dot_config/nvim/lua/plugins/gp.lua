local config = {
  providers = {
    ollama = {
      endpoint = "http://localhost:11434/v1/chat/completions",
    },
  },
  agents = {
    {
      name = "Ollama",
      provider = "ollama",
      chat = true,
      command = true,
      model = { model = "llama3:8b" },
      system_prompt = "You are a general AI assistant.\n\n"
        .. "The user provided the additional info about how they would like you to respond:\n\n"
        .. "- If you're unsure don't guess and say you don't know instead.\n"
        .. "- Ask question if you need clarification to provide better answer.\n"
        .. "- Think deeply and carefully from first principles step by step.\n"
        .. "- Zoom out first to see the big picture and then zoom in to details.\n"
        .. "- Use Socratic method to improve your thinking and coding skills.\n"
        .. "- Don't elide any code from your output if the answer requires coding.\n"
        .. "- Take a deep breath; You've got this!\n",
    },
  },
}

return config
