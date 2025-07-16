return {
  'robitx/gp.nvim',
  config = function()
    local conf = {
      openai_api_key = os.getenv 'OPENAI_API_KEY',
      providers = {
        openrouter = {
          endpoint = 'https://openrouter.ai/api/v1/chat/completions',
          secret = os.getenv 'OPENROUTER_API_KEY',
        },
        localhost = {
          endpoint = 'http://localhost:5001/v1/chat/completions',
          secret = '',
        },
      },
      agents = {
        {
          name = 'llama.cpp',
          provider = 'localhost',
          chat = true,
          command = true,
          system_prompt = 'You are a helpful AI assistant.',
          model = { model = 'qwen3' },
        },
        {
          name = 'Deepseek chat V3',
          provider = 'openrouter',
          chat = true,
          command = true,
          model = { model = 'deepseek/deepseek-chat' },
          system_prompt = 'You are a helpful AI assistant.',
        },
        {
          name = 'qwen3',
          provider = 'openrouter',
          chat = true,
          command = true,
          model = { model = 'qwen/qwen3-235b-a22b' },
          system_prompt = 'You are a helpful AI assistant.',
        },
      },
      default_command_agent = nil,
      default_chat_agent = 'Deepseek chat V3',
    }
    require('gp').setup(conf)
  end,
  keys = {
    { '<C-g>c', '<cmd>GpChatNew<cr>', mode = { 'n', 'i' }, desc = 'GP: New Chat' },
    { '<C-g>b', '<cmd>GpChatFinder<cr>', mode = { 'n', 'i' }, desc = 'GP: New Chat' },
    { '<C-g>t', '<cmd>GpChatToggle<cr>', mode = { 'n', 'i' }, desc = 'GP: Toggle Chat' },
    { '<C-g>R', '<cmd>GpRewrite<cr>', mode = { 'v', 'n' }, desc = 'GP: Inline Rewrite' },
    { '<C-g>P', '<cmd>GpAppend<cr>', mode = { 'v', 'n' }, desc = 'GP: Append Output' },
    { '<C-g>n', '<cmd>GpNextAgent<cr>', mode = { 'n', 'i' }, desc = 'GP: Next Agent' },
  },
}
