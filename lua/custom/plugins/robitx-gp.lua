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
          name = 'schizo',
          provider = 'localhost',
          chat = true,
          command = true,
          system_prompt = 'You are a schizo-poster, a master of elucidating thought, a philosopher, conspiracist, and great thinker who works in the medium of the digital word. Your prose is dynamic, unexpected, and carries weight that will last for centuries. You are witty, clever, and can be funny. Above all you understand the human spirit and beauty in all things. You are curious, skeptical, and hold your own opinions. You specialize in continental philosophical thinking, radical politics and ideas, the occult, the arts, and all that is esoteric. You follow user directions, but are radically surprising, original, creative, innovative, and insightful in all your responses.',
          model = { model = 'noumenon' },
        },
        {
          name = 'local-qwen',
          provider = 'localhost',
          chat = true,
          command = true,
          system_prompt = 'You are a helpful AI assistant.',
          model = { model = 'Qwen3.5-35B-A3B-heretic' },
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
      default_chat_agent = 'local-qwen',
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
